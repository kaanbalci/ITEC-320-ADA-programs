with ada.integer_text_io; use	ada.integer_text_io;
with ada.text_io;	use ada.text_io;
with ada.Float_text_io;	use ada.Float_text_io;


with Ada.Containers.Generic_Constrained_Array_Sort;
use Ada.Containers;

-- main procedure do_teams
procedure do_teams is


   -- procedure run containing get, functions, and put
	 procedure run	is
      subtype a_range is integer	range	1 .. 100; -- a_range 1 to 100
		subtype b_range is integer	range	1 .. 100; -- b_range 1 to 100
		subtype r is Natural	range	1 .. 99; -- r 1 to 99
      type a_team	is	array(a_range)	of	Natural; -- create array a_team
		type b_team	is	array(b_range)	of	Natural; -- create array b_team
		type n_a	is	array(r)	of	Natural; -- array for reduced a
      type	n_b is array(r) of Natural; -- array for reduced b
      -- initialize and declare all varibales being used in run procedure
      a:	a_team; -- array a team
		b:	b_team; -- array b team
		z:	n_a; -- z is reduced a
		p:	n_b; -- p is reduced b
		input_a:	Integer;
		input_b:	Integer;
		total_count: Integer := 0;
		number_of_inputs_counter:	Integer := 0;
		max_score:	Constant	Integer := 1000;
		min_score:	Constant	Integer := 1;
		A_avg: Float := 0.0;
		B_avg: Float := 0.0;
		x: Integer	:=	0;
		y: Integer	:=	0;
		large: integer := 0;
		small: integer := 0;
		small2:	integer := 0;

		index: integer;
		index2:	integer;
		index3:	integer;
		index4:	integer;


		function wins_for_A(Ateam: a_team;	Bteam: b_team;	C:	Natural)	return Integer	is
				wins_A: Integer := 0;
         begin
				for i	in	1 .. C loop
					 if Ateam(i) >	Bteam(i)	then
						  wins_A	:=	wins_A +	1;
					 end if;
		   end loop;
         return wins_A;
      end wins_for_A;


	 function wins_for_A_reduced(Ateam:	n_a; Bteam:	n_b; C: Natural) return	Integer is
		 wins_A: Integer := 0;
    begin
       for i in 1 .. C loop
				if Ateam(i) >	Bteam(i)	then
			     wins_A	:=	wins_A +	1;
				end if;
        end	loop;
        return wins_A;
     end wins_for_A_reduced;

	  function wins_for_B(Ateam: a_team; Bteam: b_team; C: Natural) return Integer is
				wins_B: Integer := 0;
        begin
				for i	in	1 .. C loop
					 if Bteam(i) >	Ateam(i)	then
						  wins_B	:=	wins_B +	1;
					 end if;
		  end	loop;
         return wins_B;
      end wins_for_B;

	 function wins_for_B_reduced(Ateam:	n_a; Bteam:	n_b; C: Natural) return	Integer is
				wins_B: Integer := 0;
      begin
				for i	in	1 .. C loop
					 if Ateam(i) <	Bteam(i)	then
						  wins_B	:=	wins_B +	1;
					 end if;
		  end	loop;
         return wins_B;
      end wins_for_B_reduced;


	  function number_of_ties(Ateam:	a_team; Bteam:	b_team; C: Natural) return	Integer is
				ties:	Integer := 0;
       begin
				for i	in	1 .. C loop
					 if Ateam(i) =	Bteam(i)	then
						  ties := ties	+ 1;
					 end if;
		  end	loop;
         return ties;
      end number_of_ties;

	function	reduced_ties(Ateam: n_a; Bteam: n_b; C: Natural) return Integer is
				ties:	Integer := 0;
        begin
				for i	in	1 .. C loop
					 if Ateam(i) =	Bteam(i)	then
						  ties := ties	+ 1;
					 end if;
		  end	loop;
         return ties;
      end reduced_ties;
      
      

	 function avg_a(Ateam: a_team; Bteam: b_team; C: Natural) return Float is
				wins_A: Integer := 0;
				total: Float := 0.0;
		  begin
				for i	in	1 .. C loop
					 if Ateam(i) >	Bteam(i)	then
						  wins_A	:=	wins_A +	1;
						  total := total + Float((Ateam(i) - Bteam(i)));
					 end if;
				end loop;
				if	wins_A /= 0	then
					 total := total/Float(wins_A);
				elsif	wins_A =	0 then
					 total := 0.0;
				end if;

				return total;
   end avg_a;
   

	function	avg_a_reduced(Ateam:	n_a; Bteam:	n_b; C: Natural) return	Float	is
				wins_A: Integer := 0;
				total: Float := 0.0;
		  begin
				for i	in	1 .. C loop
					 if Ateam(i) >	Bteam(i)	then
						  wins_A	:=	wins_A +	1;
						  total := total + Float((Ateam(i) - Bteam(i)));
					 end if;
				end loop;
				if	wins_A /= 0	then
					 total := total/Float(wins_A);
				elsif	wins_A =	0 then
					 total := 0.0;
				end if;
         return total;
    end avg_a_reduced;
    
    
    

	 function avg_b(Ateam: a_team; Bteam: b_team; C: Natural) return Float is
				wins_B: Integer := 0;
				total: Float := 0.0;
		  begin
				for i	in	1 .. C loop
					 if Bteam(i) >	Ateam(i)	then
						  wins_B	:=	wins_B +	1;
						  total := total + Float((Bteam(i) - Ateam(i)));
					 end if;
				end loop;
				if	wins_B /= 0	then
					 total := total/Float(wins_B);
				elsif	wins_B =	0 then
					 total := 0.0;
				end if;

				return total;
   end avg_b;
   

	function	avg_b_reduced(Ateam:	n_a; Bteam:	n_b; C: Natural) return	Float	is
				wins_B: Integer := 0;
				total: Float := 0.0;
		  begin
				for i	in	1 .. C loop
					 if Bteam(i) >	Ateam(i)	then
						  wins_B	:=	wins_B +	1;
						  total := total + Float((Bteam(i) - Ateam(i)));
					 end if;
				end loop;
				if	wins_B /= 0	then
					 total := total/Float(wins_B);
				elsif	wins_B =	0 then
					 total := 0.0;
				end if;

				return total;

	 end avg_b_reduced;
      -- created three sorts only used two for sorting the arrays for reduced team a and b
	 procedure fsort is new	Ada.Containers.Generic_Constrained_Array_Sort(
		Index_Type => r,
		Element_Type => Natural,
		Array_Type => n_a);

	  procedure	fsort2 is new Ada.Containers.Generic_Constrained_Array_Sort(
		Index_Type => r,
		Element_Type => Natural,
		Array_Type => n_b);

		procedure fsort3 is new	Ada.Containers.Generic_Constrained_Array_Sort(
		Index_Type => r,
		Element_Type => Natural,
		Array_Type => n_b);
      
  -- ignore help not used only used for debugging and printing out to see values
	 procedure help(a: n_a)	is
		begin
		  for	i in 1 .. 99 loop
			 put(a(i));
		  end	loop;
		 new_line;
	 end help;


begin
   -- while loop that takes input and checks if input is valid range of numbers if not it closes program
	 while not end_of_file loop
		  get(input_a);
		  if input_a >	1000 or input_a <	1 then
				put("ERROR: cant have score more then 1000 or less than 1");
				return;
				new_line;
		  end	if;
				total_count	:=	total_count	+ 1;
		  get(input_b);
		  if input_b >	1000 or input_b <	1 then
				put("ERROR: cant have score more then 1000 or less than 1");
				return;
				new_line;
		  end	if;
				total_count	:=	total_count	+ 1;
				number_of_inputs_counter := number_of_inputs_counter + 1;
		  if total_count mod	2 = 0	then
					 a(number_of_inputs_counter) := input_a;
					 b(number_of_inputs_counter) := input_b;
		  elsif total_count mod	2 /= 0 then
		  put("Error not an even amount of scores");
		  end	if;
	 end loop;
   -- avg a and avg b assigned to variables A_avg and B_avg and x and y are equal to wins for a and b
	 A_avg := avg_a(a, b, number_of_inputs_counter);
	 B_avg := avg_b(a, b, number_of_inputs_counter);
	 x	:=	wins_for_A(a, b, number_of_inputs_counter);
	 y	:=	wins_for_B(a, b, number_of_inputs_counter);

   -- check which team has more wins then the other and take away best player and worst player from respective teams
	 if y	> x then
		  small := b(1);
		  large := b(1);

		  for	i in 1 .. number_of_inputs_counter loop
					 if b(i)	> large then
						  large := b(i);
						  index := i;
					 end if;
				for i	in	1 .. number_of_inputs_counter	- 1 loop
					 if i	/=	index	then
						  p(i) := b(i);
					 elsif i	= index then
						  p(i) := b(i + 2);
					 end if;
				end loop;


		  end	loop;


	 end if;

	  if x <	y then
		  small := a(1);

		  for	i in 1 .. number_of_inputs_counter loop
					 if b(i)	< small then
						  small := a(i);
						  index2	:=	i;
					 end if;
				for i	in	1 .. number_of_inputs_counter	- 1 loop
					 if i	/=	index2 then
						  z(i) := a(i + 1);
					 elsif i	= index2	then
						  z(i) := a(i);
					 end if;
				end loop;


		  end	loop;


	 end if;


	if	x = y	then
		  small := a(1);
		  small2	:=	b(1);

		  for	i in 1 .. number_of_inputs_counter loop
					 if b(i)	< small then
						  small := a(i);
						  index3	:=	i;
					 end if;
				for i	in	1 .. number_of_inputs_counter	- 1 loop
					 if i	/=	index3 then
						  z(i) := a(i + 1);
					 elsif i	= index3	then
						  z(i) := a(i);
					 end if;
				end loop;


		  end	loop;

			for i	in	1 .. number_of_inputs_counter	loop
					 if a(i)	< small2	then
						  small2	:=	b(i);
						  index4	:=	i;
					 end if;
				for i	in	1 .. number_of_inputs_counter	- 1 loop
					 if i	/=	index4 then
						  z(i) := b(i + 1);
					 elsif i	= index4	then
						  z(i) := b(i);
					 end if;
				end loop;


		  end	loop;


	 end if;

   -- all put statements and formatting for procedure run
	 put("Original Pairings");
	 new_line;
	 put("   Wins for A: ");
	 put(wins_for_A(a, b, number_of_inputs_counter), 1);
	 new_line;
	 put("   Wins for B: ");
	 put(wins_for_B(a, b, number_of_inputs_counter), 1);
	 new_line;
	 put("   Ties: ");
	 put(number_of_ties(a, b, number_of_inputs_counter), 1);
	 new_line;
	 put("   Average A wins: ");
	 put(A_avg,	1,	1,	0);
	 new_line;
	 put("   Average B wins: ");
	 put(B_avg,	1,	1,	0);
	 new_line;
	 put("Reduced Pairings");
	 new_line;
	 put("   Wins for A: ");
	 put(wins_for_A_reduced(z,	p,	number_of_inputs_counter -	1), 1);
	 new_line;
	 put("   Wins for B: ");
	 put(wins_for_B_reduced(z,	p,	number_of_inputs_counter -	1), 1);
	 new_line;
	 put("   Ties: ");
	 put(reduced_ties(z,	p,	number_of_inputs_counter -	1), 1);
	 new_line;
	 put("   Average A wins: ");
	 put(avg_a_reduced(z, p, number_of_inputs_counter - 1), 1, 1, 0);
	 new_line;
	 put("   Average B wins: ");
	 put(avg_b_reduced(z, p, number_of_inputs_counter - 1), 1, 1, 0);
	 new_line;
	 put("Reduced best vs best pairings");
	 new_line;
	 put("   Wins for A: ");
    -- sort array a(z) and b(p)
	 fsort(z);
	 fsort2(p);
	 put(wins_for_B_reduced(z,	p,	number_of_inputs_counter -	1), 1);
	 new_line;
	 put("   Wins for B: ");
	 put(wins_for_A_reduced(z,	p,	number_of_inputs_counter -	1), 1);
	 new_line;
	 put("   Ties: ");
	 put(reduced_ties(z,	p,	number_of_inputs_counter -	1), 1);
	 new_line;
	 put("   Average A wins: ");
	 put(avg_b_reduced(z, p, number_of_inputs_counter - 1), 1, 1, 0);
	 new_line;
	 put("   Average B wins: ");
	 put(avg_a_reduced(z, p, number_of_inputs_counter - 1), 1, 1, 0);
	 new_line;
   -- reverse array 
	 number_of_inputs_counter := number_of_inputs_counter	- 1;
	 for i in reverse	1 .. number_of_inputs_counter	loop
		  p(i) := p(i);
	 end loop;
	 number_of_inputs_counter := number_of_inputs_counter	+ 1;

	 put("Reduced best vs worst pairings");
	 new_line;
	 put("   Wins for A: ");
	 put(wins_for_B_reduced(z,	p,	number_of_inputs_counter -	1), 1);
	 new_line;
	 put("   Wins for B: ");
	 put(wins_for_A_reduced(z,	p,	number_of_inputs_counter -	1), 1);
	 new_line;
	 put("   Ties: ");
	 put(reduced_ties(z,	p,	number_of_inputs_counter -	1), 1);
	 new_line;
	 put("   Average A wins: ");
	 put(avg_b_reduced(z, p, number_of_inputs_counter - 1), 1, 1, 0);
	 new_line;
	 put("   Average B wins: ");
	 put(avg_a_reduced(z, p, number_of_inputs_counter - 1), 1, 1, 0);




-- exception handlers and their outputs
exception
	 when	data_error =>
		  put_line("You must enter a number!");
	 when	constraint_error =>
		  put_line("Must enter an non-negative value!");
	 when	end_error =>
		  put_line("Premature end of file!");
	 when	others =>
		  put_line("Unknown exception occurred!");

end run;

-- main that calls run.
begin
run;

end do_teams;