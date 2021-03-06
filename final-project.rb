class Hospital
    attr_accessor :money, :name, :patients_number, :nurse_number, :operating_hours
    def initialize(name)
        @name=name
        #as a default the hospital has 50 dollars
        @money=50
        @nurse_number
        @patients_number
        @operating_hours
        # @line = 0 
    end 
    #Increases money by multiplying the number of patients by a random number from 1 to 5 
    def money_increase
        @money+=rand(1..5)*@patients_number.to_i
    end 
    
    #prompts the user for input about name of hospital, number of nurses,number of patients, operating hours
    #returns them
    def get_input
        puts "Welcome. You are opening up your Hospital for the first time.Today is the initiation day for your hospital. Please enter the name of your hospital."
        @name = ""
        @name = gets.chomp
          puts "Welcome to #{name.capitalize} Hospital"
          puts 
        puts "Enter number of nurses"
        @nurse_number = ""
        @nurse_number = gets.chomp
        puts "You have #{nurse_number} working nurses"
        puts 
        puts "Enter number of patients"
        @patients_number = ""
        @patients_number = gets.chomp
        puts "You have #{patients_number} patients seeking care."
        puts 
        puts "Enter number of operating hours"
        @operating_hours = ""
        @operating_hours = gets.chomp
        puts "Your hospital is open #{operating_hours} hours a day"
        puts
        # puts "Optionally, you can enter the names of a few patients to see their records. "
            # @patient_name=""
        # until @patient_name.upcase == "DONE"
            # puts "Enter the name of your first patient in line."
            # @patient_name= gets.chomp
            # unless @patient_name.upcase == "DONE"
            # Patient.new(@patient_name)
            # puts "Thank you for inputting #{@patient_name.capitalize}'s information."
            # puts "Optionally enter the name of another patient."
            # end
        # end 
        
    end 
    
    #determines how long the shifts are by taking the input of operating hours and dividing by nurse number
    def shift_determination
        if @operating_hoursl.to_i == 0 || @operating_hours == nil
            puts "Oh no! Operating hours must be more than 0."
        else
            @operating_hours.to_i / @nurse_number.to_i
        end
    end 
    
    # def check_records
    #     puts "Here is the information about the patients you input."
    #     action =""
    #     until Patient.all.length == 1 || action == "DONE"
    #     current_patient = Patient.all[Patient.line % Patient.all.length]
    #     puts "#{current_patient.patient_name}'s record. Entered the hospital with a health of #{@health} and after receiving treatment, left with a health of #{@health.patient_care}"
    #     end
    # end 
    
end 

#when initialized the nurses have shift and are assigned to a hospital. 
class Nurse
    attr_accessor :shift
    def initialize(hospital)
        @shift=hospital.shift_determination
        @hospital=hospital
    end 
# this method take in the patient argument and calls the patient care method on the patient.
#it then puts out how many hours the nurse shift is. 
    def give_care(patient)
        patient.patient_care(@hospital)
        puts "The nurses have #{@shift} hour long shifts."
    end 
end 

#when the patient class is initialized it has health attribute, patient_name
#the health instance variable is a random variable from -20 to 1 because patients come in different conditions

class Patient
    @@all=[]
    attr_accessor :health,:patient_name
    def initialize(patient_name)
        @health=rand(-20..-1)
        @patient_name
        # @@all << self
    end 
    

    
    #patient care method makes sure that the user inputs a nurse number that is more than 0
    #if the hospital has more than 0 nurses, this method increases the health of the patient by a random number from 20 to 100 and then returns the new health
    def patient_care(hospital)
        if hospital.nurse_number.to_i <= 0 || hospital.nurse_number == nil
        puts "The hospital is in need of nurses!"
        else
            @health+=rand(20..100)
            puts "The #{hospital.name.capitalize} Hospital now has $#{hospital.money_increase}"
            puts "The patient's health is now #{@health}"
        end
    end 
end 


#hospital is created 
h=Hospital.new("Hospital 1")
h.get_input
puts
# #patient is created
jane = Patient.new("jane")
john = Patient.new("john")
# #patient receives care in hospital h

#nurse is created and pass in the value for the hospital
nurse_1=Nurse.new(h)
# # #nurse_1 gives care to a patient
nurse_1.give_care(jane)
puts
nurse_1.give_care(john)

# def test_patients
#     Patient.new("eva")
#     Patient.new("john")
# end

# Hospital.check_records
