-- This is the implementation for the BigNum abstract data type, which supports
-- arithmetic with VERY LARGE natural values.  The operations provided
-- work as one would expect for natural numbers.

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body BigNumPkg-Signed is


   InternalBase : constant Positive := 10;


   function "<"  (X, Y : BigNum) return Boolean is
   begin
      for I in 0..Size-1 loop
         if X(I) < Y(I) then
            return True;
         elsif X(I) > Y(I) then
            return False;
         end if;
      end loop;
      return False;
   end "<";

   function ">"  (X, Y : Signed_BigNum) return Boolean is
   begin
      return not (X < Y or X = Y);
   end ">";

   function "<=" (X, Y : Signed_BigNum) return Boolean is
   begin
      return X = Y or X < Y;
   end "<=";

   function ">=" (X, Y : Signed_BigNum) return Boolean is
   begin
      return not (X < Y);
      -- return Standard.">="(X, Y); -- Causes error on intel platform
   end ">=";

   function "+" (X, Y : Signed_BigNum) return BigNum is
      Overflow : Boolean;
      Result : BigNum;
   begin
      plus_ov (X, Y, Result, Overflow);

      if Overflow then
         raise BigNumOverFlow;
      end if;
      return Result;
   end "+";

   -- Currently implemented as repeated addition.  This make "*" slow,
   -- but at least the result is correct. :-)
   --
   function "*" (X, Y : BigNum) return BigNum is
      Count, Result : BigNum := Zero;
   begin
      while Count /= Y loop
         Count := Count + One;
         Result := Result + X;
      end loop;
      return Result;
   end "*";

   -- Skips leading whitespace (spaces, tabs, end of lines) before
   -- the data to be read.
   --
   procedure Get (Item : out BigNum) is
      Letter : Character;
      LineEnd : Boolean;
      LastI : Natural := 0;
   begin
      -- Skip leading whitespace
      loop
         if End_Of_File then
            raise DATA_ERROR;
         elsif End_Of_Line then
            Skip_Line;
         else
            Look_Ahead(Letter, LineEnd);

            -- exit if find a digit
            exit when Letter in '0'..'9';
            -- Original version skipped leading zeros, as follows:
            -- exit when Letter in '1'..'9';

            Get(Letter);
            if Letter /= ' ' and Letter /= ASCII.HT
               and Letter /= '0' then
               raise DATA_ERROR;
            end if;
         end if;
      end loop;

      -- Read in digits of number
      for I in 0..Size-1 loop
         exit when End_Of_Line;
         Look_Ahead(Letter, LineEnd);
         exit when LineEnd;
         exit when Letter not in '0'..'9';
         Get(Item(I), Width => 1);
         LastI := I;
      end loop;

      -- If there's still more digits, then raise DATA_ERROR.
      Look_Ahead(Letter, LineEnd);
      if Letter in '0'..'9' then
         raise DATA_ERROR;
      end if;

      -- Shift digits to the left within the array
      for I in reverse 0..LastI loop
         Item(I+Size-1-LastI) := Item(I);
      end loop;
      for I in 0..Size-2-LastI loop
         Item(I) := 0;
      end loop;
   end Get;

   -- Writes a BigNum to the output, padding with leading spaces
   -- if the width given is larger than the length of the number
   -- (leading zeros are not printed).
   --
   procedure Put (Item : BigNum; Width : Natural := 1) is
      First : Integer := Size-1;
   begin
      -- Determine where the first digit of the number is,
      -- and thus the length of the number.
      for I in 0..Size-1 loop
         if Item(I) /= 0 then
            First := I;
            exit;
         end if;
      end loop;

      -- Put any leading blanks that are necessary.
      for I in Size-First+1..Width loop
         Put(' ');
      end loop;

      -- Write out the digits of the number.
      for I in First..Size-1 loop
         Put(Item(I), Width => 1);
      end loop;
   end Put;

function negate (X : Signed_BigNum) return Signed_BigNum is




end BigNumPkg;