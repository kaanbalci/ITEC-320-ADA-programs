-- This is the implementation for an integer stack abstract data type.

package body StackPkg is

    function IsEmpty (S : StackType) return Boolean is
    begin
        return S.TheTop = 0;
    end IsEmpty;

    function IsFull (S : StackType) return Boolean is
    begin
        return S.TheTop = MaxSize;
    end IsFull;

    function  Top  (S : StackType) return Integer is
    begin
        return S.Elements(S.TheTop);
    end Top;

    procedure Push (I : Integer; S : in out StackType) is
    begin
        if IsFull(S) then
            raise Stack_Is_Full;
        else
            S.TheTop := S.TheTop + 1;
            S.Elements(S.TheTop) := I;
        end if;
    end Push;

    procedure Pop  (S : in out StackType) is
    begin
        if IsEmpty(S) then
            raise Stack_Is_Empty;
        else
            S.TheTop := S.TheTop - 1;
        end if;
    end Pop;

end StackPkg;