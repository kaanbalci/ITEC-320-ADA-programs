-- Read one word per line and print list of unique words and their frequencies
-- Case sensitive
-- This is a minimalist version.  No bells or whistles.
with ada.integer_text_io; use ada.integer_text_io;
WITH Ada.Text_Io; USE Ada.Text_Io;
with Ada.Strings; use Ada.Strings;
WITH Ada.Strings.Fixed; USE Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;



procedure antipals  is
   type Word is record
      s: String(1 .. 50);   -- The string.  Assume 50 characters or less
      wlen: Natural;        -- Length of the word

   END RECORD;


   type Word_Array is array(1 .. 1000) of Word;

   type Word_List is record
      words: Word_Array;        --  The words
      num_words: Natural := 0;   --  Number of words
   end record;
   

PROCEDURE Get_Words(Wl: OUT Word_List) IS
   BEGIN
      wl.num_words := 0;  -- only to get rid of a warning
      while not End_of_File loop
         declare
            S: String := Trim(Get_Line, Both);
        begin

               wl.num_words := wl.num_words + 1;
               wl.words(wl.num_words).s(1 .. s'last) := s;
               wl.words(wl.num_words).wlen := s'length;


         end;
      END LOOP;

   end get_words;
   
   FUNCTION StringReverse(S: String) RETURN String IS

    BEGIN 

    IF S'Length <= 1 THEN
      RETURN S;
    ELSE
      RETURN StringReverse(S(S'First+1..S'Last)) & S(S'First);
    END IF;

   END StringReverse;
   
    function Check (Line: String) return Boolean is
      begin
       for I in 0 .. Line'Length/2 - 1 loop
          if (Line(Line'First+I)/=Line(Line'Last-I)) then
             return False;
          end if;
       end loop;
       return True;
    end Check;
   
      
      
      
   
  
   
   
   procedure put_words(wl: Word_List) is
   
    x : String := wl.words(1).s(1 .. wl.words(1).wlen)(8 .. wl.words(1).s(1 .. wl.words(1).wlen)'length - 1);
    b : String := StringReverse(wl.words(2).s(1 .. wl.words(2).wlen)(8 .. wl.words(2).s(1 .. wl.words(2).wlen)'last - 2));
    code : String(1 .. 100);
    y : String := "code:";
    
   begin
      
      for i in 1 .. wl.num_words loop
      new_line;
         put(wl.words(i).s(1 .. wl.words(i).wlen));
            -- y := StringReverse(wl.words(i).s(1 .. wl.words(i).wlen)(8 .. wl.words(i).s(1 .. wl.words(i).wlen)'last - 2));
        if check(wl.words(i).s(1 .. wl.words(i).wlen)(8 .. wl.words(i).s(1 .. wl.words(i).wlen)'length - 1)) then
        new_line;
         put("Status: Palindrome");
          -- Shift((wl.words(i).s(1 .. wl.words(i).wlen)(8 .. wl.words(i).s(1 .. wl.words(i).wlen)'length - 1), code) 
                                                       
        end if;                                               
           -- put(code);                                       
         -- put(StringReverse(wl.words(i).s(1 .. wl.words(i).wlen)));
         -- put("Status: ");
      end loop;
      
     
   end put_words;

   the_words: Word_List;
  
   
begin
   get_words(the_words);
   Put_Words(The_Words);

end antipals;
