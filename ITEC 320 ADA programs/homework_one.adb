-- File: homework_one.adb
-- Name: Kaan Balci
-- Date: 1/23/2018

-- Purpose: Calculate points surplus or deficit
--          based on hours taken and GPA

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure homework_one is

   -- Personal data  to be modified
   name: constant String := "Kaan Balci";      -- Student name
   hours_attempted: constant Natural := 46;   -- Hours taken
   gpa: constant Float := 2.5;                -- Current GPA
   -- End of personal data  to be modified

   earned_points: Float;             -- Points actually attained

   -- Requirements
   Required_GPA: constant := 2.0;     -- GPA required to graduate
   required_points: Float;            -- Points needed to graduate

   -- Points calculations
   surplus, deficit: Float;           -- Points above or below required

begin
   -- Calculation
   earned_points := Float(hours_attempted) * gpa;
   required_points := Required_GPA * Float(hours_attempted);

   -- Calculate both even though one will not be needed
   surplus := earned_points - required_points; 
   deficit := required_points - earned_points;

   -- Output
   put_line("Name: " & name);
   put_line("Hours:" & hours_attempted'img);

   put("GPA: ");
   put(item => gpa, fore => 1, aft => 3, exp => 0);
   new_line;

   put("Grade Points: ");
   put(earned_points, 1, 2, 0);
   new_line;

   -- Surplus or deficit
   if earned_points > Required_GPA then
      put("Points above 2.0: ");
      put(surplus, fore => 1, aft => 2, exp => 0);
      new_line;
   else
      put("Points below 2.0: ");
      put(deficit, fore => 1, aft => 2, exp => 0);
      new_line;
   end if;

end homework_one;
