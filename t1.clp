 (deftemplate malaria (slot sign1) (slot sign2) (slot sign3) (slot sign4) (slot sign5) (slot sign6))
(deftemplate Denguefever(slot sign1) (slot sign2) (slot sign3) (slot sign4) (slot sign5) (slot sign6) (slot sign7) (slot sign8) (slot sign9))
(deftemplate Pulmonary(slot sign1) (slot sign2) (slot sign3) (slot sign4) (slot sign5) (slot sign6) (slot sign7) (slot sign8) (slot sign9) (slot sign10))
(deftemplate Sleeping(slot sign1) (slot sign2) (slot sign3) (slot sign4) (slot sign5) (slot sign6) (slot sign7) (slot sign8) (slot sign9) (slot sign10)
(slot sign11) (slot sign12) (slot sign13) (slot sign14) (slot sign15) )
(deftemplate  Typhoid (slot sign1) (slot sign2) (slot sign3) (slot sign4) (slot sign5) (slot sign6) (slot sign7) (slot sign8))


(deffacts m1 (malaria (sign1 fever)(sign2 shaking)(sign3 bloodsmears)(sign4  diagnostic)(sign5 malaise)(sign6 fatigue)))
(deffacts d1  (Denguefever (sign1 retroorbital)(sign2 anorexia)(sign3  TissueCultur)(sign4  PCR)(sign5 fever)(sign6 rash) (sign7 lymphadenopathy)(sign8 paroxysmal )
(sign9 feelingmalaise)))
(deffacts p1(Pulmonary (sign1 fever)(sign2 chestpain)(sign3  haemoptysis)(sign4  weightloss)(sign5 sweating)(sign6 anorexi) (sign7 fatigue)
(sign8 Sputumculture) (sign9 AFBstaining) (sign10 ChestX-ray)))
(deffacts s1 (Sleeping(sign1 myalgia)(sign2 lymphadenopathy)(sign3  BldCulture)(sign4  ESR)(sign5 Bloodsmears)(sign6 Plateletcnt) (sign7 malaise)
(sign8 arthralgia) (sign9 facialoedema) (sign10 painlessskin) 
(sign11 fever) (sign12 erythematousskin) (sign13 Aspiration) (sign14  CSFassay) (sign15  Lumbarpuncture)))
(deffacts t1 (Typhoid (sign1 BldCulture )(sign2 Widaltest)(sign3  headache)(sign4  malaise)(sign5 UrineCultur)(sign6 fever) (sign7 StoolCulture)
(sign8 abdominalpain)))


(defrule rule1
(malaria (sign1 ?s1)(sign2 ?s2))
 (not (ifYesNochoise?))
=>
 (printout t crlf 
 " Welcome: Answer the following questions to help you diagnose." crlf 
"============="crlf
"The following questions are answered yes in the case if the patient has both symptoms"crlf
"============="crlf
" Do you have a " ?s1 " with feeling " ?s2  
" swollen eyelids ? (Yes | No) " crlf " Your answer: " ) 
(assert (ifYesNochoise(read)))) 

(defrule rule2 
(ifYesNochoise yes)
 (not (ifYesNochoise1 ?))
=>
(printout t crlf "----------------------------------------------------------------------------------------------------"crlf
" Bloodsmears and Rapid diagnostic tests,are the result of both positive? (yes | no) " crlf " Your answer: " )
 (assert (ifYesNochoise1 (read)))) 

 (defrule rule3
(ifYesNochoise1 yes)
 (not (ifYesNochoise2 ?))
 =>
 (printout t crlf "----------------------------------------------------------------------------------------------------"crlf
" Do you feel malaise and fatigue? (yes | no) " crlf  " Your answer: " )
 (assert (ifYesNochoise2 (read)))) 

 (defrule rule4
(ifYesNochoise2 yes)
 =>
 (printout t "----------------------------------------------------------------------------------------------------"crlf
crlf" You are suffering from malaria" 
crlf ))



 (defrule rule5
 (ifYesNochoise2 no)
 =>
 (printout t "----------------------------------------------------------------------------------------------------"crlf
 " You should be sure for your symptoms.. Try again..." 
"/////////////////////////////////////////////////////////////////////"crlf
crlf " Thank you for using my Program..."crlf crlf))

 (defrule rule44
 (ifYesNochoise1 no)
 =>
 (printout t "----------------------------------------------------------------------------------------------------"crlf
crlf crlf crlf" You should be sure for your symptoms.. Try again..." 
crlf " Thank you for using my Program...
"crlf crlf ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;الحمي اللي هنتقل ليها لو اجبت علي اول سؤال ب لا

(defrule rule6
(ifYesNochoise no)
 (not (ifYesNochoise3 ?))
 =>

 (printout t crlf crlf crlf "----------------------------------------------------------------------------------------------------"crlf
" Do you have a retro-orbital pain with feeling  anorexia? (yes | no) " crlf crlf " Your answer: " )
 (assert (ifYesNochoise3 (read))))


(defrule rule7
(ifYesNochoise3 yes)
 (not (ifYesNochoise4 ?))
=>
(printout t crlf crlf crlf "----------------------------------------------------------------------------------------------------"crlf
" Tissue Cultur and (PCR that detect dengue virus),are the result of both positive? (yes | no) " crlf crlf " Your answer: " )
 (assert (ifYesNochoise4 (read)))) 


(defrule rule8
(ifYesNochoise4 yes)
 (not (ifYesNochoise5 ?))
=>
(printout t crlf crlf crlf "----------------------------------------------------------------------------------------------------"crlf
" Do you have a fever, paroxysmal with feeling  rash? (yes | no) " crlf crlf " Your answer: " )
 (assert (ifYesNochoise5 (read)))) 


(defrule rule9
(ifYesNochoise5 yes)
 (not (ifYesNochoise6 ?))
=>
(printout t crlf crlf crlf "----------------------------------------------------------------------------------------------------"crlf
" Do you have a lymphadeno pathy, paroxysmal with feeling malaise? (yes | no) " crlf crlf " Your answer: " )
 (assert (ifYesNochoise6 (read)))) 


 (defrule rule10
 (ifYesNochoise4 no)
 =>
 (printout t "----------------------------------------------------------------------------------------------------"crlf
" You should be sure for your symptoms..  Try again..." 
crlf " Thank you for using my Program..."crlf crlf))

(defrule rule11
 (ifYesNochoise5 no)
 =>
 (printout t "----------------------------------------------------------------------------------------------------"crlf
crlf crlf crlf" You should be sure for your symptoms.. 
Try again..." 
crlf " Thank you for using my Program..."crlf crlf))

(defrule rule12
 ?retractChy <- (ifYesNochoise6 no)
 =>
 (printout t "----------------------------------------------------------------------------------------------------"crlf
crlf crlf crlf" You should be sure for your symptoms.. 
Try again..." 
crlf " Thank you for using my Program..."crlf crlf ))

 (defrule rule13
(ifYesNochoise6 yes) 
=>
 (printout t "----------------------------------------------------------------------------------------------------"crlf
crlf" You are suffering from Dengue fever" crlf ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;مرض 5 Pulmonary Tuberculosis


(defrule rule14
(ifYesNochoise3 no)
 (not (ifYesNochoise7 ?))
 =>
 (printout t crlf "----------------------------------------------------------------------------------------------------"crlf
" Do you have a fever, paroxysmal with feeling  chest pain? (yes | no) " crlf " Your answer: " )
 (assert (ifYesNochoise7 (read))))

(defrule rule15
(ifYesNochoise7 yes)
 (not (ifYesNochoise8 ?))
 =>
 (printout t crlf "----------------------------------------------------------------------------------------------------"crlf
" Do you have a haemoptysis with feeling  weight loss? (yes | no) " crlf " Your answer: " )
 (assert (ifYesNochoise8 (read))))


(defrule rule16
(ifYesNochoise8 yes)
 (not (ifYesNochoise9 ?))
 =>
 (printout t crlf "----------------------------------------------------------------------------------------------------"crlf
" Do you have a sweating with feeling  anorexia and  fatigue? (yes | no) " crlf " Your answer: " )
 (assert (ifYesNochoise9 (read))))

(defrule rule17
 (ifYesNochoise8 no)
 =>
 (printout t "----------------------------------------------------------------------------------------------------"crlf
crlf crlf crlf" You should be sure for your symptoms.. 
Try again..." crlf
" Thank you for using my Program...
"crlf ))

(defrule rule18
(ifYesNochoise9 yes)
 (not (ifYesNochoise10 ?))
 =>
 (printout t crlf crlf crlf "----------------------------------------------------------------------------------------------------"crlf
" Sputum culture  and AFB staining and Chest X-ray ,are the result of both positive? (yes | no) " crlf crlf " Your answer: " )
 (assert (ifYesNochoise10 (read))))

(defrule rule19
 (ifYesNochoise9 no)
 =>
 (printout t "----------------------------------------------------------------------------------------------------"crlf
" You should be sure for your symptoms.. Try again..." crlf

" Thank you for using my Program..."crlf))

 (defrule rule20
(ifYesNochoise10 yes)
 =>
 (printout t "----------------------------------------------------------------------------------------------------"crlf
" You are suffering from Pulmonary Tuberculosis"
crlf ))


(defrule rule21
 (ifYesNochoise10 no)
 =>
 (printout t "----------------------------------------------------------------------------------------------------"crlf
" You should be sure for your symptoms.. Try again..."
crlf "Thank you for using my Program..."crlf crlf))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;مرض4(Sleeping Sickness)


(defrule rule22
(ifYesNochoise7 no)
 (not (ifYesNochoise11 ?))
 =>
 (printout t crlf "----------------------------------------------------------------------------------------------------"crlf
" Do you have a fever, paroxysmal and painless skin chancre with feeling  erythematous skin lesions? (yes | no) " crlf " Your answer: " )
 (assert (ifYesNochoise11 (read))))

(defrule rule23
(ifYesNochoise11 yes)
 (not (ifYesNochoise12?))
 =>
 (printout t crlf "----------------------------------------------------------------------------------------------------"crlf
" Aspiration  and  Lumbar puncture and CSF assay  ,are the result of all this positive? (yes | no) " crlf " Your answer: " )
 (assert (ifYesNochoise12 (read))))

(defrule rule24
(ifYesNochoise12 yes)
 (not (ifYesNochoise13 ?))
 =>
 (printout t crlf "----------------------------------------------------------------------------------------------------"crlf
" Do you have a facial oedema and arthralgia and myalgia and lymphadeno pathy  with feeling  malaise? (yes | no) " crlf " Your answer: " )
 (assert (ifYesNochoise13 (read))))


(defrule rule25
 (ifYesNochoise12 no)
 =>
 (printout t "----------------------------------------------------------------------------------------------------"crlf
crlf" You should be sure for your symptoms.. Try again..." crlf
" Thank you for using my Program...
"crlf ))

(defrule rule26
(ifYesNochoise13 yes)
 (not (ifYesNochoise14 ?))
 =>
 (printout t crlf "----------------------------------------------------------------------------------------------------"crlf
"Platelet cnt  and   Bloodsmears and  ESR and Bld Culture  ,are the result of all this positive? (yes | no) " crlf " Your answer: " )
 (assert (ifYesNochoise14 (read))))


(defrule rule27
 (ifYesNochoise13 no)
 =>
 (printout t "----------------------------------------------------------------------------------------------------"crlf
crlf crlf crlf" You should be sure for your symptoms.. Try again..." crlf
" Thank you for using my Program...
"crlf ))

 (defrule rule28
(ifYesNochoise14 yes)

 =>
 (printout t "----------------------------------------------------------------------------------------------------"crlf
" You are suffering from African Trypanosomiasis (Sleeping sickness)"
crlf ))

(defrule rule29
 (ifYesNochoise14 no)
 =>
 (printout t "----------------------------------------------------------------------------------------------------"crlf
crlf crlf crlf" You should be sure for your symptoms.. Try again..." crlf
" Thank you for using my Program...
"crlf ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;مرض 3  (Typhoid) 
(defrule rule30
(ifYesNochoise11 no)
 (not (ifYesNochoise15 ?))
 =>
 (printout t crlf "----------------------------------------------------------------------------------------------------"crlf
" Do you have a fever, paroxysmal with feeling   abdominal pain? (yes | no) " crlf " Your answer: " )
 (assert (ifYesNochoise15 (read))))

(defrule rule31
(ifYesNochoise15 yes)
 (not (ifYesNochoise16 ?))
 =>
 (printout t crlf "----------------------------------------------------------------------------------------------------"crlf
" Stool Culture and Urine Cultur ,are the result of both positive? (yes | no) " crlf " Your answer: " )
 (assert (ifYesNochoise16 (read))))

(defrule rule32
 (ifYesNochoise15 no)
 =>
 (printout t "----------------------------------------------------------------------------------------------------"crlf
crlf"Make sure you answer the previous questions about symptoms of other diseases.... Try again..." crlf
" Thank you for using my Program...
"crlf ))


(defrule rule33
(ifYesNochoise16 yes)
 (not (ifYesNochoise17 ?))
 =>
 (printout t crlf "----------------------------------------------------------------------------------------------------"crlf
" Do you have a malaise with feeling   headache? (yes | no) " crlf " Your answer: " )
 (assert (ifYesNochoise17 (read))))


(defrule rule34
 (ifYesNochoise16 no)
 =>
 (printout t "----------------------------------------------------------------------------------------------------"crlf
crlf" You should be sure for your symptoms.. Try again..." crlf" Thank you for using my Program...
"crlf ))


(defrule rule35
(ifYesNochoise17 yes)
 (not (ifYesNochoise18 ?))
 =>
 (printout t crlf "----------------------------------------------------------------------------------------------------"crlf
" Widal test and Bld Culture  ,are the result of both positive? (yes | no) " crlf " Your answer: " )
 (assert (ifYesNochoise18 (read))))

(defrule rule36
 (ifYesNochoise17 no)
 =>
 (printout t "----------------------------------------------------------------------------------------------------"crlf
crlf" You should be sure for your symptoms.. Try again..." crlf" Thank you for using my Program...
"crlf ))

 (defrule rule37
(ifYesNochoise18 yes)
 (not (ifYesNochoise301 ?))
 =>
 (printout t "----------------------------------------------------------------------------------------------------"crlf
" You are suffering from Enteric (Typhoid) fever"
crlf ))


(defrule rule38
 (ifYesNochoise18 no)
 =>
 (printout t "----------------------------------------------------------------------------------------------------"crlf
crlf" You should be sure for your symptoms.. Try again..." crlf" Thank you for using my Program...
"crlf ))