class Student
# The class must provide a function to calculate the #final letter grade.
	private
	attr_accessor :studentID, :student_cla, :student_ola, :student_quiz,
			  :student_exam, :student_final, :student_total

	public
	def initialize(id, cla, ola, quiz, exam, final)
		@studentID = id
		@student_cla = cla.to_i
		@student_ola = ola.to_i
		@student_quiz = quiz.to_i
		@student_exam = exam.to_i
		@student_final = final.to_i
		@student_total = cla.to_i + ola.to_i + quiz.to_i + exam.to_i + final.to_i
	end

	def studentID
		@studentID = cla.to_i
	end

	def student_cla
		@student_cla = cla
	end

	def student_ola
		@student_ola = ola
	end

	def student_quiz
		@student_quiz = quiz
	end

	def student_exam
		@student_exam  = exam
	end

	def student_final
		@student_final = final
	end

	def student_total
		@student_total = cla + ola + quiz + exam + final
	end

	def student_letter
		@student_letter = " "
	end

	if (student_total >= 90)
		student_letter = "A"
	else if (student_total >= 87 && student_total < 90)
		student_letter = "B+"
	else if (student_total >= 83 && student_total < 87)
		student_letter = "B"
	else if (student_total >= 80 && student_total < 83)
		student_letter = "B-"
	else if (student_total >= 77 && student_total < 80)
		student_letter = "C+"
	else if (student_total >= 73 && student_total < 77)
		student_letter = "C"
	else if (student_total >= 70 && student_total < 73)
		student_letter = "C-"
	else if (student_total >= 67 && student_total < 70)
		student_letter = "D+"
	else if (student_total >= 63 && student_total < 67)
		student_letter = "D"
	else if (student_total >= 60 && student_total < 63)
		student_letter = "D-"
	else
		student_letter = "F"

end



def initialization()
	@hash_map = Hash.new
	@counter = 0.0
	@ola_avg = 0
	@cla_avg = 0
	@quiz_avg = 0
	@exam_avg = 0
	@final_avg = 0
	@cla_max = 0
	@ola_max = 0
	@quiz_max = 0
	@exam_max = 0
	@final_max = 0
end

def totalPointsFound()
	@hash_map.each do |key, value|
		if(@hash_map[key].studentID != "C#")
			total = @hash_map[key].student_cla.to_i + hash_map[key].student_ola.to_i + @hash_map[key].student_quiz.to_i +
				@hash_map[key].student_exam.to_i + @hash_map[key].student_final.to_i

				@hash_map[key].points_sum = sum
				@hash_map[key].student_letter(sum)

				end
		end
end

def storingObjects(givenfile)
		file = File.open(givenfile)

		file.each_line do |line|
			key, file_cla, file_ola, file_quiz, file_exam, file_final = line.chomp.split(" ", 6)
			new_stud = Student.new(key, file_cla, file_ola, file_quiz, file_exam, file_final)
			@hash_map[key] = new_stud
		end
end


def userQuery()
	for i in 1..2 do
		puts ("Enter a C#: ")
		number = gets.chomp()

		display = "%s %s %s %s %s %s" %[@hash_map[number].studentID.to_s,
									@hash_map[number].student_cla.to_s,
									@hash_map[number].student_ola.to_s,
									@hash_map[number].student_quiz.to_s,
									@hash_map[number].student_exam.to_s,
                  					@hash_map[number].student_final.to_s,
									@hash_map[number].student_letter.to_s]
		puts display
	end

	@hash_map.each do |key, value|
		if (@hash_map[key].studentID != "C#")
			display = "%-15s %-5s %-5s %-5s %-5s %-5s" %[@hash_map[number].studentID.to_s,
													  @hash_map[number].student_cla.to_s,
													  @hash_map[number].student_ola.to_s,
													  @hash_map[number].student_quiz.to_s,
													  @hash_map[number].student_exam.to_s,
													  @hash_map[number].student_final.to_s,
													  @hash_map[number].student_letter.to_s]
		puts display
		else
			display = "%-15s %-5s %-5s %-5s %-5s %-5s" %[@hash_map[number].studentID.to_s,
													  @hash_map[number].student_cla.to_s,
													  @hash_map[number].student_ola.to_s,
													  @hash_map[number].student_quiz.to_s,
													  @hash_map[number].student_exam.to_s,
													  @hash_map[number].student_final.to_s,
													  @hash_map[number].student_letter.to_s]
		puts display
		end
	end
end


def maxAndAvg()
	@hash_map.each do |key, value|
		if(@hash_map[key].studentID != "C#")
			@cla_avg += @hash_map[key].student_cla.to_i
			@ola_avg += @hash_map[key].student_ola.to_i
			@quiz_avg += @hash_map[key].student_quiz.to_i
			@exam_avg += @hash_map[key].student_exam.to_i
			@final_avg += @hash_map[key].student_final.to_i
			@counter += 1

			if (@hash_map[key].student_cla.to_i > @cla_max)
				@cla_max  = @hash_map[key].student_cla.to_i
			end

			if (@hash_map[key].student_ola.to_i > @ola_max )
				@ola_max  = @hash_map[key].student_ola.to_i
			end

			if (@hash_map[key].student_quiz.to_i > @quiz_max)
				@quiz_max = @hash_map[key].student_quiz.to_i
			end

			if (@hash_map[key].student_exam.to_i > @exam_max)
				@exam_max = @hash_map[key].student_exam.to_i
			end

			if (@hash_map[key].student_final.to_i > @final_max)
				@final_max = @hash_map[key].student_final.to_i
			end
		end
	end
end

puts "Please give a file name"
userinput = gets.chomp
initialization()
storingObjects(userinput)
userQuery()
maxAndAvg()
