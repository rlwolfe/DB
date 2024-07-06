from faker import Faker
import random
fake = Faker()


# creates employees
employee = ""
for i in range(200000):
    employee += f"INSERT INTO \"Employee\" (empid, name, birthdate, start_date, department)\n\
        VALUES ({i}, '{fake.name()}', '{fake.date_of_birth(None, 18, 65)}', '{fake.date_this_century()}', \
                '{random.choice(['Library', 'Desk', 'Archives', 'Management', 'Security'])}');\n\n"


with open(r"C:\Users\Rachel\Documents\COLLEGE!\tal_23-24\Sem 2\DB\proj\Employee.sql", "w") as file:
    file.write(employee)
  
# sorts employee types   
prev = None
lib_lines = []
desk_lines = []
arch_lines = []
mngr_lines = []
sec_lines = []
with open(r"C:\Users\Rachel\Documents\COLLEGE!\tal_23-24\Sem 2\DB\proj\Employee.sql", "r") as file:
    for line in file:
        if "INSERT" in line: prev = line
        
        elif "Library" in line:
            lib_lines.append(prev)
            lib_lines.append(line)
            lib_lines.append('\n')
            
        elif "Desk" in line:
            desk_lines.append(prev)
            desk_lines.append(line)
            desk_lines.append('\n')
            
        elif "Archives" in line:
            arch_lines.append(prev)
            arch_lines.append(line)
            arch_lines.append('\n')
            
        elif "Management" in line:
            mngr_lines.append(prev)
            mngr_lines.append(line)
            mngr_lines.append('\n')
            
        elif "Security" in line:
            sec_lines.append(prev)
            sec_lines.append(line)
            sec_lines.append('\n')

with open(r"C:\Users\Rachel\Documents\COLLEGE!\tal_23-24\Sem 2\DB\proj\Librarian.sql", "w") as file:
    file.writelines(lib_lines)
with open(r"C:\Users\Rachel\Documents\COLLEGE!\tal_23-24\Sem 2\DB\proj\Secratary.sql", "w") as file:
    file.writelines(desk_lines)
with open(r"C:\Users\Rachel\Documents\COLLEGE!\tal_23-24\Sem 2\DB\proj\Manager.sql", "w") as file:
    file.writelines(mngr_lines)
with open(r"C:\Users\Rachel\Documents\COLLEGE!\tal_23-24\Sem 2\DB\proj\Security.sql", "w") as file:
    file.writelines(sec_lines)
with open(r"C:\Users\Rachel\Documents\COLLEGE!\tal_23-24\Sem 2\DB\proj\Preserver.sql", "w") as file:
    file.writelines(arch_lines)
  
# creates librarians   
lst = []
lines = []
with open(r"C:\Users\Rachel\Documents\COLLEGE!\tal_23-24\Sem 2\DB\proj\Librarian.sql", "r") as file:
    for line in file:
        if "INSERT" in line: lines.append(line)
            
        elif "VALUES" in line:
            lst = line.split(',')
            lst.insert(1, f", '{random.choice(['children', 'mystery', 'fantasy', 'romance', 'science fiction', 'thriller', 'historical fiction', 'biography', 'self-help', 'cookbook'])}'")
            for l in lst:
                lines.append(l)
            lines.append('\n')
            
with open(r"C:\Users\Rachel\Documents\COLLEGE!\tal_23-24\Sem 2\DB\proj\Librarian.sql", "w") as file:
    file.writelines(lines)
  
    
# creates managers
lst = []
lines = []
with open(r"C:\Users\Rachel\Documents\COLLEGE!\tal_23-24\Sem 2\DB\proj\Manager.sql", "r") as file:
    for line in file:
        if "INSERT" in line: lines.append(line)
            
        elif "VALUES" in line:
            lst = line.split(',')
            lst.insert(1, f", '{random.choice(['Library', 'Desk', 'Archives', 'Security'])}'")
            for l in lst:
                lines.append(l)
            lines.append('\n')
            
with open(r"C:\Users\Rachel\Documents\COLLEGE!\tal_23-24\Sem 2\DB\proj\Manager.sql", "w") as file:
    file.writelines(lines)

# creates perservers
lst = []
lines = []
with open(r"C:\Users\Rachel\Documents\COLLEGE!\tal_23-24\Sem 2\DB\proj\Preserver.sql", "r") as file:
    for line in file:
        if "INSERT" in line: lines.append(line)
            
        elif "VALUES" in line:
            lst = line.split(',')
            lst.insert(1, f", '{random.choice(['children', 'mystery', 'fantasy', 'romance', 'science fiction', 'thriller', 'historical fiction', 'biography'])}'")
            for l in lst:
                lines.append(l)
            lines.append('\n')
            
with open(r"C:\Users\Rachel\Documents\COLLEGE!\tal_23-24\Sem 2\DB\proj\Preserver.sql", "w") as file:
    file.writelines(lines)


# creates security
lst = []
lines = []
with open(r"C:\Users\Rachel\Documents\COLLEGE!\tal_23-24\Sem 2\DB\proj\Security.sql", "r") as file:
    for line in file:
        if "INSERT" in line: lines.append(line)
            
        elif "VALUES" in line:
            lst = line.split(',')
            lst.insert(1, f", '{random.choice(['Front door', 'Back door', 'Side door', 'Main floor', 'Archives'])}'")
            for l in lst:
                lines.append(l)
            lines.append('\n')
            
with open(r"C:\Users\Rachel\Documents\COLLEGE!\tal_23-24\Sem 2\DB\proj\Security.sql", "w") as file:
    file.writelines(lines)




# creates shifts
shift = ""
for i in range(24):
    shift += f"INSERT INTO \"Shift\" (day_of_week, timeslot)\nVALUES ('Sunday', '{i}:00');\n\n"
    shift += f"INSERT INTO \"Shift\" (day_of_week, timeslot)\nVALUES ('Monday', '{i}:00');\n\n"
    shift += f"INSERT INTO \"Shift\" (day_of_week, timeslot)\nVALUES ('Tuesday', '{i}:00');\n\n"
    shift += f"INSERT INTO \"Shift\" (day_of_week, timeslot)\nVALUES ('Wednesday', '{i}:00');\n\n"
    shift += f"INSERT INTO \"Shift\" (day_of_week, timeslot)\nVALUES ('Thursday', '{i}:00');\n\n"
    shift += f"INSERT INTO \"Shift\" (day_of_week, timeslot)\nVALUES ('Friday', '{i}:00');\n\n"
    shift += f"INSERT INTO \"Shift\" (day_of_week, timeslot)\nVALUES ('Saturday', '{i}:00');\n\n"
        
with open(r"C:\Users\Rachel\Documents\COLLEGE!\tal_23-24\Sem 2\DB\proj\Shift.sql", "w") as file:
    file.write(shift)
      
    
# assigns shifts  
shift = ""
for i in range(50000):
    shift += f"INSERT INTO works (empid, day_of_week, timeslot)\n\
    VALUES ({random.randint(0, 199999)}, '{fake.day_of_week()}', '{fake.time('%H')}:00');\n\n"
        
with open(r"C:\Users\Rachel\Documents\COLLEGE!\tal_23-24\Sem 2\DB\proj\Works.sql", "w") as file:
    file.write(shift)
    
