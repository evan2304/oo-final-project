class Hospital
    attr_accessor :money, :name
    def initialize(name)
        @name=name
        @money=50
         
    end 
    #Increases money by 1.25 dollars
    def money_increase
        @money+=1.25
    end 
    
end 

class Nurse
    attr_accessor :shift
    def initialize(hospital)
        @shift=8
        @hospital=hospital
    end 
    
    def give_care(patient)
        @shift-=1
        patient.patient_care(@hospital)
        puts "The nurse has #{@shift} hours left of their shift."
    end 
end 

class Patient
    attr_accessor :health
    def initialize
        @health=-10
    end 
    
    #Hospital money increase
    def patient_care(hospital)
        @health+=30
        puts "The #{hospital.name} now has $#{hospital.money_increase}"
        puts "The patient's health is now #{ @health}"
    end
end 

#hospital is created 
h=Hospital.new("Hospital 1")
#patient is created
eva=Patient.new
#patient receives care in hospital h
#eva.patient_care(h) #=> 20

#nurse is created and pass in the value for the hospital
nurse_1=Nurse.new(h)
#nurse_1 gives care to a patient
nurse_1.give_care(eva)


