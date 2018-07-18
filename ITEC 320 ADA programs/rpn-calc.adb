with Ada.Strings.Unbounded;  use Ada.Strings.Unbounded;
with Ada.Text_IO;            use Ada.Text_IO;
with StackPkg;		       use StackPkg;
with BigNumPkg;		       use BigNumPkg;
 
procedure rpn_calc is
   S: StackType;
   input: Integer’Image;
   total: Integer’Image;
   X: Integer;
   Y: Integer;
   final: Integer’Image;
   function calc (input : String) return String is
    
      case input is
	when ‘0’ .. ‘9’ => push(input, S);
	when ‘P’        => pop(input’last, S);
	when ‘+’        => pop(input’last - 1 = X, input’last = Y); (Y+X = total); push(total, S);
	when ‘-‘	 => pop(input’last - 1 = X, input’last = Y); (Y-X = total); push(total, S);
	when ‘*’	 => pop(input’last - 1 = X, input’last = Y); (Y*X = total); push(total, S);
	when ‘p’	 => pop(input’last = final); put(final); new_line;
   end calc;
 
begin
loop
   get(input);
   toString(input);
   calc(input); 
end loop;

end rpn_calc;