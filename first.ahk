; class ABC
; {
;     fc_testFor(){
;         veg := ["Asparagus", "Broccoli", "Cucumber"]
;         for n in veg
;             if MsgBox,("#" A_Index " = " n "`nContinue?",, "y/n") = "No"
;             break
;     }
; }

MsgBox, "Start" ,, "ok T3"

; Training:=[]
; Training.push(fc_Testloop()) 
; Training.push(fc_testwhile()) 
; Training.push(fc_testclass()) 

; Create an array and add functions to it
;Training2 := [Func("fc_Testloop"), Func("fc_testwhile"), Func("fc_testclass")]
in1 := false
in2 := false
;fc_testif(in1,in2)
; Training[2]
fc_TestArray()
;fc_testwhile(3)

ExitApp

; The loop
fc_Testloop(){
    MsgBox,,("Test loop",)

    veg := ["Asparagus", "Broccoli", "Cucumber"]
    Loop veg.Length
    {
        MsgBox, veg[A_Index]
        OutputDebug veg[2] . a_index

    }
}

; The While
fc_testwhile(limit){
var :=0
    while(var<=limit){
        outputdebug "test While" . var
        var++
    }
        outputdebug "end While"

}

; fc_testnestfunction(){
;     timertest() {
;         x := "tock!"
;         tick() {
;             MsgBox, x ; x causes this to become a closure.
;             SetTimer tick, 0 ; Using the closure's original var is safe.
;             ; SetTimer t, 0    ; Capturing t would create a reference cycle.
;         }
;         t := tick ; This is okay because t isn't captured above.
;         SetTimer t, 1000
;     }

;     timertest()
; }

; The If
fc_testif(parm,rama){
    
    if(parm==true  && rama==true){
                outputdebug "parm is true and rama is true"
    }Else if(parm==true && rama==false){
                outputdebug "parm is true and rama is false"
    }else{
                outputdebug "parm is false"
                outputdebug "rama is true or False"
                outputdebug "parm is false ..."
    }

}

; The Array
fc_TestArray(){
    ; Training[2]
    veg := ["Asparagus", "Broccoli", "Cucumber"]
    OutputDebug, veg.Length . `n
    RemovedValue := veg.Pop() 
    MsgBox, % RemovedValue
    OutputDebug, % veg.Length
}

; The variable

;the For
fc_testFor(){
    veg := ["Asparagus", "Broccoli", "Cucumber"]
    for n in veg
       ; if MsgBox,,"#" A_Index " = " n "`nContinue?",, "y/n") = "No"
        break
}

; The class

; Define a simple class
class Person {
    ; Constructor
    __New(name, age) {
        this.name := name
        this.age := age
    }

    ; Method to display information
    ShowInfo() {
       ; MsgBox, "Name:" this.name `"nAge:" this.age
    }
}

; Define a simple class
class Person2 {
    ; Constructor
    __New(name, age) {
        this.name := name
        this.age := age
    }

    ; Method to display information
    ShowInfo() {
       ; MsgBox,("Name: " . this.name . "`nAge: " . this.age)
    }
}

fc_testclass(){
    ; ; Create an instance of the class
    ; personv := Person2("John Doe", 30)

    ; ; Call the method
    ; personv.ShowInfo()
}

fc_log(){

}
