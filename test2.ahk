#SingleInstance Force

; Create an array and add functions to it
Training :=[]
Training := [Func("fc_Testloop"), Func("fc_testwhile"), Func("fc_testclass")]
; Training:=[]
; Training.push(fc_Testloop()) 
; Training.push(fc_testwhile()) 
; Training.push(fc_testclass()) 

; Example of calling functions from the array
loop Training.Length 
{
    OutputDebug a_index
    Training[a_index]
}




; Define your functions
fc_Testloop() {
    ; Your function code here
    MsgBox("This is fc_Testloop function")
}

fc_testwhile() {
    ; Your function code here
    MsgBox("This is fc_testwhile function")
}

fc_testclass() {
    ; Your function code here
    MsgBox("This is fc_testclass function")
}
