import subprocess

matlab_executable = 'C:\Program Files\MATLAB\R2023b\bin\matlab.exe'

image_path = input("Please Enter The Exact Path to your Image: ")
print('\n')

print('Running MatlabCode1')
matlab_process = subprocess.run(['matlab', '-batch', "path = f{image_path};run('matlabcode1.m');pause(1);"], capture_output=True)


with open('input.txt','r') as file: 
     line = file.readline()
     input_array = [str(value) for value in line.split()]

#print(input_array)

print("Compiling C Code")
subprocess.run(["gcc","CProg.c","-o","CProgExec"])
print("Running C executable")
process = subprocess.run(["./CProgExec.exe"],capture_output = True, text = True)

# store the output of the C program in a python variable
output_variable = process.stdout.strip()

#print or use the stored output
#print("C program output:")
#print(output_variable)

print('Compiling haskell code')
subprocess.run(['ghc','C:\\Programming\\Python\\haskellcode.hs'])
print('Running Haskell Code')
process = subprocess.run(['C:\\Programming\\Python\\haskellcode'], text = True, capture_output = True)
result = process.stdout.strip()
#print(result)

with open("haskelloutput.txt","w") as file:
    file.write(result)
    file.close

print('Running Prolog Code')
prolog_input = "[" + ",".join(input_array) + "]."
result = subprocess.run(
    ['swipl', '-q', '-g', 'main', '-t', 'halt', 'PrologCode.pl'], 
    input=prolog_input, 
    capture_output=True, 
    text=True
)
output_result = result.stdout.strip()
#print(output_result)

with open("prologout.txt","w") as file:
     file.write(output_result.strip("[]").replace(',',' '))
     file.close

print("Displaying images with matlabcode2")
matlab_process = subprocess.run(['matlab', '-batch', "run('matlabcode2.m');pause(1);"], capture_output=True)


