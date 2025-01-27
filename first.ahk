
MsgBox, "Start main script" ,, 2

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
;fc_TestArray()
;fc_testwhile(3)
;fc_testFor()
fc_testVariable()

ExitApp

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

;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< [ The variable ] >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;


fc_testVariable(){
    ; Declare a variable
    var := "Hello World"
    ; Display the variable
    MsgBox, % var
    ; Change the value of the variable
    var := "Goodbye World"
    ; Display the variable
    MsgBox, % var
    ; Declare a number
    num := 42
    ; Display the number
    MsgBox, % num
    ; Change the value of the number
    num := 100
    ; Display the number
    MsgBox, % num
    ; Declare a boolean
    bool := true
    ; Display the boolean
    MsgBox, % bool
    ; Change the value of the boolean
    bool := false
    ; Display the boolean
    MsgBox, % bool
    ; Declare an array
    arr := ["Apple", "Banana", "Cherry"]
    ; Display the array
    MsgBox, % arr[1]
    ; Change the value of the array
    arr[1] := "Grape"
    ; Display the array
    MsgBox, % arr[1]
    ; Declare an object
    obj := {name: "John", age: 30}
    ; Display the object
    MsgBox, % obj.name
    ; Change the value of the object
    obj.name := "Jane"
    ; Display the object
    MsgBox, % obj.name
}



;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< [ The If ] >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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

;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< [ The Array ] >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;
fc_TestArray(){
    ; Training[2]
    veg := ["Asparagus", "Broccoli", "Cucumber"]
    OutputDebug,% veg.Length()
    RemovedValue := veg.Pop()
    MsgBox, % RemovedValue
    OutputDebug, % RemovedValue
    x := veg.MaxIndex()
    OutputDebug, % x
}

;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< [ The For ] >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;

fc_testFor(){
    veg := ["Asparagus", "Broccoli", "Cucumber"]
    for n in veg
    {
        display := "veg" . A_Index . "=" . veg[n]
        fc_log("test For",display)
    }

}




;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< [ The Loop ] >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;

fc_Testloop(){
    MsgBox,,("Test loop",)

    veg := ["Asparagus", "Broccoli", "Cucumber"]
    Loop veg.Length
    {
        MsgBox, veg[A_Index]
        OutputDebug veg[2] . a_index

    }
}
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< [ The while ] >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;

fc_testwhile(limit){
    var :=0
    while(var<=limit){
        outputdebug, % "test While" . var
        fc_log("test While",var)
        var++
    }
    outputdebug "end While"

}


;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< [ The Class ] >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;

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
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< [ The Log ] >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;
fc_log(description,Value){
    Global
    EnableLog := true
    if(EnableLog){
        pp = Log
        path = %A_ScriptDir%\%pp%
        IfNotExist, %path%
            FileCreateDir, %pp%
        filename =  %A_YYYY%%A_MM%%A_DD%_log.txt
        co := Chr(126)
        ValueLog := Value . co . A_Hour . ":" . A_Min . ":" . A_Sec . "-" . A_DD A_MM A_YYYY
        FileAppend, %description%  =  %ValueLog% `n, %A_ScriptDir%\Log\%filename%
    }

}