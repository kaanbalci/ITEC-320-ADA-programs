 --|----------------|
 --|-- Kaan Balci --|
 --|-- ITEC 320 ----|
 --|-- Project 2 ---|
 --|-------------------------------------------------------------------------------------------------------| 
 --|-- References used for help: https://rosettacode.org and http://www.radford.edu/~nokie/classes/320/ ---|
 --|-------------------------------------------------------------------------------------------------------|
 with Ada.Text_Io; use Ada.Text_Io;
 with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
 with Ada.Strings; use Ada.Strings;
 with Ada.Text_IO; use Ada.Text_IO;
 with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
 with Ada.Characters.Handling, Ada.Text_IO; use  Ada.Characters.Handling, Ada.Text_IO;
 ----------------------------------------------------------------------------------------

-- procedure pal_finder inside contains run procedure which is called to execute program
procedure pal_finder is

procedure run is 
  -- Palindrome function. takes in string and returns a boolean. I is the offset. checks if string entered is a palindrome
    function Pal (Text : String) return Boolean is
        begin
            for I in 0..Text'Length / 2 - 1 loop
                if Text (Text'First + I) /= Text (Text'Last - I) then
                    return False;
                end if;
            end loop;
                return True;
        end Pal;
        
-- Strip function takes in a string and returns a string without any of the following special characters !@#$%^&*()`~-_+=' 
-- used google for help. Rosettacode had a function that helped accomplish this
function remove(input_String: String) return String is
            chars: String := "!@#$%^&*()`~-_+=' ";
            Keep:   array (Character) of Boolean := (others => True);
            Result: String(input_String'Range);
            Last:   Natural := Result'First-1;
            counter: Integer := 0;
begin
    
      for I in chars'Range loop
         Keep(chars(I)) := False;
      end loop;
      for J in input_String'Range loop
         if Keep(input_String(J)) then
            Last := Last+1;
            Result(Last) := input_String(J);
         end if;
      end loop;
      return Result(Result'First .. Last);
end remove;

--------------------------------------------------------------------------------------------------------------------------------------
---Count remove reuses remove function to count # of chars. if eve!!! then counter equals 6 
---later in run procedure use count remove - remove to get the total special chars removed.
function Count_remove(input_String: String) return Integer is
            chars: String := "!@#$%^&*()`~-_+=' ";
            Keep:   array (Character) of Boolean := (others => True);
            Result: String(input_String'Range);
            Last:   Natural := Result'First-1;
            counter: Integer := 0;
            orig_length: Integer := 0;
begin
      orig_length := input_String'length;
      for J in input_String'Range loop
         if Keep(input_String(J)) then
            Last := Last+1;
            Result(Last) := input_String(J);
         end if;
            counter := counter + 1;
            -- counter := orig_length - counter;
      end loop;
        
        return counter;
    end Count_remove;
  
----------------------------------------------------------------------------------------------------------------------

    -- declare string with bounds up to 72 and len is of natural type # of chars inputed
    s: String(1 .. 72);           
    len: Natural;
----------------------------------------------------------------------------------------------------------------------
        
Begin
      
    WHILE NOT End_Of_File LOOP
    
    -- while not end of file loops call get_line to get input from data file or standard input. formatted with quotes.    
      get_line(s, len);
      Put("String: ");
      set_col(9);
      Put("""");
      Put(s(1..len));
      Put("""");
      New_Line;
      
      -- IF ELSE statements using palindrome function, To_Upper, remove and count remove to format and provide correct output
      --checks to see if its a palindrome as is
      IF Pal(s(1..len)) THEN
         Put("Status: Palindrome as entered");
         NEW_LINE;
      --checks if pal when upper case
      ELSIF Pal(To_Upper(s(1..len))) THEN
         Put("Status: Palindrome when converted to upper case");
         NEW_LINE;
     --checks if pal after removing special characters and counts the chars removed
      ELSIF Pal(remove(s(1..len))) THEN
         Put("Status: Palindrome when non-letters are removed");
         NEW_LINE;
         Put("Characters removed: ");
         Put(Count_remove(S(1..len)) - remove(S(1..len))'length, 1);
         NEW_LINE;
      --checks if pal after removing special characters and when upper case     
      ELSIF Pal(remove(To_Upper(S(1..len)))) THEN
         Put("Status: Palindrome when non-letters are removed and converted to upper case");
         NEW_LINE;
         Put("Characters removed: ");
         Put(Count_remove(S(1..len)) - remove(S(1..len))'length, 1);
         NEW_LINE;
      --nothing else holds true then not a palindrome!     
      ELSE
         Put("Status: Not a palindrome");
         NEW_LINE;
      END IF;
         NEW_LINE;
    END LOOP;
    
End run; 
----------------------------------------------------------------------------------------------------------------------

-- call run to execute
begin
    run;
end pal_finder; 
----------------------------------------------------------------------------------------------------------------------


