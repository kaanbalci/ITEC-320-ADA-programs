 with Ada.Text_Io;
 use Ada.Text_Io;
 with Ada.Integer_Text_Io;
 use Ada.Integer_Text_Io;
 with Ada.Strings;
 use Ada.Strings;

procedure decBinary is

FUNCTION StringReverse(S: String) RETURN String is
    begin
    
    if S'Length <= 1 THEN
        RETURN S;
    ELSE
        RETURN StringReverse(S(S'First+1..S'Last)) & S(S'First);
    END IF;
END StringReverse;

        
procedure convert_num(x : in integer) is

 Convert : integer;
 Binary : String (1..32);
 Count : Integer := 32;

begin
 -- set the string to all zeroes
    Binary := "00000000000000000000000000000000";
 -- get the number to be converted
 -- decimal to binary conversion
 -- fill in the bit pattern from left to right
 Convert := x;
 loop
 exit when Count = 0;
 -- if the remainder is non-zero, the bit is set to 1
 -- else the bit is 0
 if (Convert mod 2) = 1 then
 Binary(Count) := '1';
 else
 Binary(Count) := '0';
 end if;

 Count := Count -1;
 Convert := Convert/2;

 end loop;
 
 new_line;
 put("Original:  ");
 Ada.Integer_Text_IO.put(x, 9);
 put(' ' & Binary);
 if StringReverse(StringReverse(Binary)) /= StringReverse(Binary) then
        put("  Different");
    else
        put("  Same");
 end if;
 new_line;
 put("Reversed:  ");
 put(x, 9);
 put(' ');
 put(StringReverse(Binary));
 new_line;
 put("Pruned  :          ");
 put(' ');
 new_line;
 put("Reversed:          ");
 new_line;

    
 
end convert_num;

    procedure run is 
    
        set_size: integer; -- set size variable
        x: integer;
        
    begin 
        get(set_size);
    -- while set_size > 0 loop
        for i in 1..set_size loop
            get(x);
            convert_num(x);
           
        end loop;
    -- end loop;
    end run;

begin
    run;
end decBinary; 
