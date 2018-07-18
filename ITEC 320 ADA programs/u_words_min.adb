-- Read one word per line and print list of unique words and their frequencies
-- Case sensitive
-- This is a minimalist version.  No bells or whistles.
with ada.integer_text_io; use ada.integer_text_io;
WITH Ada.Text_Io; USE Ada.Text_Io;
with Ada.Strings; use Ada.Strings;
WITH Ada.Strings.Fixed; USE Ada.Strings.Fixed;


procedure u_words_min  is
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


         end; --  declare
      END LOOP;

   end get_words;

   procedure put_words(wl: Word_List) is
   begin
      for i in 1 .. wl.num_words loop

         put(wl.words(i).s(1 .. wl.words(i).wlen));
         new_line;
      end loop;
   end put_words;

   the_words: Word_List;
begin
   get_words(the_words);
   Put_Words(The_Words);

end u_words_min;