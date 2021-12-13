import sys
A1=[]
X=[]
S=[]
gclk=[]
wires_li=[]

def collectwires(inputfilename):
    inputfile=open(inputfilename,"r+")
    for i in inputfile:
        if(i.find("sky130_fd_sc_hd__nor")!=-1):
            for j in inputfile:
                if(j.find(".Y(")!=-1):
                    input=j.replace(".Y(","")
                    input=input.replace(")","")
                    input=input.split()
                    wires_li.append(input[0])
                    break
        elif(i.find("sky130_fd_sc_hd__a21oi")!=-1):
                    for j in inputfile:
                        if(j.find(".Y(")!=-1):
                            input=j.replace(".Y(","")
                            input=input.replace(")","")
                            input=input.split()
                            wires_li.append(input[0])
                            break
            
    inputfile.close()

def clkgating(inputfilename,clockname):
    sky=0
    wire=0
    unique=0
    wire_count=0
    clkprinting=0
    create_inv =0
    reg = False
    remove_nor=False
    inputfile=open(inputfilename,"r+")
    for h in inputfile:
        if(h.find("sky130_fd_sc_hd__mux2")!=-1):
            for g in inputfile:
                if(g.find("[")!=-1):
                    reg=True
                    break
                else:
                    unique+=1
                    break  
        elif(h.find("sky130_fd_sc_hd__a")!=-1 and h.find("oi")!=-1):
            collectwires(inputfilename)
            remove_nor=True
            create_inv+=1
                    
    inputfile.close()
    inputfile=open(inputfilename,"r+")
    outputfile_name = inputfilename.replace(".gl.v",".gated.v")
    outputfile= open(outputfile_name,'w+')
    outputfile.write("`include \"primitives.v\""+'\n')
    outputfile.write("`include \"sky130_hd.v\""+'\n')
    if(unique ==0 or reg):
        unique+=1
    wire_count=unique
    clkprinting=unique 
    print_inv=create_inv
    for i in inputfile:
      if(remove_nor):
         if((i.find("module")!=-1)and(i.find("endmodule")==-1)):
            outputfile.write(i)
            outputfile.write('\n')
            name="_g"+clockname+str(wire)+"_ ;"
            outputfile.write("  wire "+name+'\n')
            wire_count-=1
         elif((i.find("wire")!=-1)):
            wname=i.replace("wire ","")
            wname=wname.replace(";","")
            wname=wname.split()
            if(wname[0] not in wires_li):
                outputfile.write(i)
            if(create_inv>0):
                outputfile.write("  wire _inv"+str(create_inv)+"_ ;"+'\n')
                create_inv-=1
         elif(i.find("sky130_fd_sc_hd__a21oi")!=-1):
            for j in inputfile:
                done=True
                if(j.find(";")==-1):
                    if(j.find("A2")!=-1):
                        input=j.replace(".A2(","")
                        input=input.replace("),","")
                        input=input.split()
                        inv_name="_inv"+str(print_inv)+"_"
                        print_inv-=1
                        sky+=1
                        outputfile.write("  sky130_fd_sc_hd__inv_1 _"+str(sky)+"_ (" +'\n')
                        outputfile.write("   .A("+input[0]+")," +'\n')
                        outputfile.write("   .Y("+str(inv_name)+")" +'\n')
                        outputfile.write("  );" +'\n')
                        A1.append(inv_name) 
                    elif(j.find("Y")!=-1):
                        en=j.replace(".Y(","")
                        en=en.replace(")","")
                        en=en.split()
                        X.append(en) 
                    elif(j.find("A1")!=-1):
                        input=j.replace(".A1(","")
                        input=input.replace("),","")
                        input=input.split()
                        S.append(input[0])
                    done=False
                if(done):
                   break
            if(clkprinting>0 ):
                sky+=1
                outputfile.write("  sky130_fd_sc_hd__dlclkp_1 _"+str(sky)+"_ (" +'\n')
                clkname="_g"+clockname+str(wire)+"_"
                wire-=1
                gclk.append(clkname)
                enable=S.pop()
                outputfile.write("   .GCLK("+clkname+")," +'\n')
                outputfile.write("   .CLK(" +clockname+"),"+'\n')
                outputfile.write("   .GATE("+enable+")" +'\n')
                outputfile.write("  );" +'\n')
                clkprinting-=1

         elif((i.find("sky130_fd_sc_hd__dfxtp")!=-1)):
            for j in inputfile:
                done=True
                if(j.find(";")==-1):
                    if(j.find("Q")!=-1):
                        Q=j.replace(".Q(","")
                        Q=Q.replace(")","") 
                        Q=Q.split()
                    elif (j.find("D")!=-1):
                        D=j.replace(".D(","")
                        D=D.replace("),","") 
                        D=D.split()
                    done=False
                if(done):
                   break
            line=str(i)
            line=line.partition("(")[0]
            mod_string=""
            for z in range(len(line) - 3):
                mod_string = mod_string + line[z]
            sky+=1
            outputfile.write(mod_string+str(sky)+"_ (" +'\n') #print given size
            if(len(gclk)>0):
                gclk_name=gclk.pop()
            #print ("A")
            ind=X.index(D)
            D_needed=A1[ind]
            outputfile.write("   .CLK("+gclk_name+")," +'\n')
            outputfile.write("   .D("+D_needed+")," +'\n')
            outputfile.write("   .Q("+Q[0]+")" +'\n')
            outputfile.write("  );" +'\n')

         elif((i.find("/*")!=-1)):
            pass
         elif(remove_nor and (i.find("sky130_fd_sc_hd__nor")!=-1) ):
            for j in inputfile:
                done=True
                if(j.find(";")==-1):
                    pass
                    done=False
                if(done):
                   break
         elif((i.find("sky")!=-1)):
            line=str(i)
            line=line.partition("(")[0]
            mod_string=""
            for z in range(len(line) - 3):
                mod_string = mod_string + line[z]
            sky+=1
            outputfile.write(mod_string+str(sky)+"_ (" +'\n')

         else :
            outputfile.write(i)


      else :
        line=i.split()
        if((i.find("module")!=-1)and(i.find("endmodule")==-1)):
            outputfile.write(i)
            outputfile.write('\n')
            name="_g"+clockname+str(wire)+"_ ;"
            outputfile.write("  wire "+name+'\n')
            wire_count-=1
        elif((i.find("wire")!=-1)):
            if(wire_count>0):
                wire+=1
                name="_g"+clockname+str(wire)+"_ ;"
                wire_count-=1
                outputfile.write("  wire "+name+'\n')
        elif(i.find("sky130_fd_sc_hd__mux2")!=-1):
            for j in inputfile:
                done=True
                if(j.find(";")==-1):
                    if(j.find("A1")!=-1):
                        input=j.replace(".A1(","")
                        input=input.replace("),","")
                        input=input.split()
                        A1.append(input[0]) 
                    elif(j.find("X")!=-1):
                        en=j.replace(".X(","")
                        en=en.replace(")","")
                        en=en.split()
                        X.append(en) 
                    elif(j.find("S")!=-1):
                        input=j.replace(".S(","")
                        input=input.replace("),","")
                        input=input.split()
                        S.append(input[0])
                    done=False
                if(done):
                   break
            if(clkprinting>0):
                sky+=1
                outputfile.write("  sky130_fd_sc_hd__dlclkp_1 _"+str(sky)+"_ (" +'\n')
                clkname="_g"+clockname+str(wire)+"_"
                wire-=1
                gclk.append(clkname)
                enable=S.pop()
                outputfile.write("   .GCLK("+clkname+")," +'\n')
                outputfile.write("   .CLK(" +clockname+"),"+'\n')
                outputfile.write("   .GATE("+enable+")" +'\n')
                outputfile.write("  );" +'\n')
                clkprinting-=1

        elif((i.find("sky130_fd_sc_hd__dfxtp")!=-1)):
            for j in inputfile:
                done=True
                if(j.find(";")==-1):
                    if(j.find("Q")!=-1):
                        Q=j.replace(".Q(","")
                        Q=Q.replace(")","") 
                        Q=Q.split()
                    elif (j.find("D")!=-1):
                        D=j.replace(".D(","")
                        D=D.replace("),","") 
                        D=D.split()
                    done=False
                if(done):
                   break
            line=str(i)
            line=line.partition("(")[0]
            mod_string=""
            for z in range(len(line) - 3):
                mod_string = mod_string + line[z]
            sky+=1
            outputfile.write(mod_string+str(sky)+"_ (" +'\n') #print given size
            if(len(gclk)>0):
                gclk_name=gclk.pop()
            #print ("A")
            ind=X.index(D)
            D_needed=A1[ind]
            outputfile.write("   .CLK("+gclk_name+")," +'\n')
            outputfile.write("   .D("+D_needed+")," +'\n')
            outputfile.write("   .Q("+Q[0]+")" +'\n')
            outputfile.write("  );" +'\n')

        elif((i.find("/*")!=-1)):
            pass
        else :
            outputfile.write(i)















    inputfile.close()









def main():
    inputfilename =sys.argv[2]
    clockname=sys.argv[1].replace("-","")
    clkgating(inputfilename,clockname)
    print ("Clock Gating Preformed")

if __name__ == "__main__": 
    main()
