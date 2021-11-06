with    Ada.Strings.Fixed, Ada.Text_IO, Ada.Integer_Text_IO;
use     Ada.Strings.Fixed, Ada.Text_IO, Ada.Integer_Text_IO;

procedure adaFrogGame is

    LastIndex : Natural;
    SplitIndex : Integer;

    JumpHeight : Integer;
    NumberOfPipes : Integer;
    CurrentPipe : Integer;
    CurrentJump : Integer;

    String_Buffer : String(1..300) := (others => ' ');
    Sep : String := " ";


    procedure Split(Source : in String; Pos: in Integer; Value : out Integer; Remainder: out String) is
        Temp : String(1..Source'Last);
    begin

        if Pos = Source'Last then Move(Source, Temp);
        else Move(Source(Source'First .. Pos-1), Temp); 
            Move(Source(Pos+1 .. Source'Last), Remainder);
        end if;

        Value := Integer'Value(Temp);

    end Split;

begin
    Get_Line(Item => String_Buffer, Last => LastIndex);
    
    SplitIndex := Index(Source => String_Buffer, Pattern => Sep, From => 1);
    Split(Source => String_Buffer, Pos => SplitIndex, Value => JumpHeight, Remainder => String_Buffer);
    Split(Source => String_Buffer, Pos => String_Buffer'Last, Value => NumberOfPipes, Remainder => String_Buffer);
    
    Get_Line(Item => String_Buffer, Last => LastIndex);
    
    for i in 1 .. NumberOfPipes loop
        SplitIndex := Index(Source => String_Buffer, Pattern => Sep, From => 1);
        Split(Source => String_Buffer, Pos => SplitIndex, Value => CurrentJump, Remainder => String_Buffer);
        
        if i /= 1 and abs(CurrentJump - CurrentPipe) > JumpHeight then
            Put_Line("GAME OVER");
            exit;
        end if;

        CurrentPipe := CurrentJump;

        if i = NumberOfPipes then
            Put_Line("YOU WIN");
        end if;

    end loop;

end adaFrogGame;