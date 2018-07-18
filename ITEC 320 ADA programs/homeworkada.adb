-- Kaan Balci
-- homework_one for ITEC 320
-- Ada 

with ada.text_io; use ada.text_io; 
with ada.integer_text_io; use ada.integer_text_io;

procedure homeworkada is
    -- create variable names with type integer.
    inputOne : integer;
    inputTwo : integer;
    sum : integer;
    product : integer;
    avg : integer;
begin
    -- Create Prompt for two integer inputs and display them after entered.
    put("Enter Two Integers: ");
    get(inputOne);
    get(inputTwo);
    new_line;
    put("Number 1: ");
    put(inputOne);
    new_line;
    put("Number 2: ");
    put(inputTwo);
    
    -- Addition, Multiplication, and Average logic.
    sum := inputOne + inputTwo;
    product := inputOne * inputTwo;
    avg := sum/2;
    
    -- print out and format answers.
    new_line(2);
    put("Sum: ");
    put(sum, 2);
    new_line;
    put("Product: ");
    put(product, 2);
    new_line;
    put("Average: ");
    put(avg, 2);
end homework_one;
    
    
    
    


