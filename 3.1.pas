const MAXSIZE = 50;
type Stack = record  { стек рассчитан на 50 символов }
      tags: array[1..MAXSIZE] of integer;
      size: integer; { число элементов }
     end;

procedure Push( var S: Stack; x: integer);
begin
  if S.size = MAXSIZE then Exit;  // выход, если произошло переполнение стека
  S.size := S.size + 1;
  S.tags[S.size] := x; // добавляем элемент
end;

function Pop (var S: Stack): integer;
begin
  if S.size = 0 then begin
    Result := 0;
    Exit;
  end;
  Result := S.tags[S.size];
  S.size := S.size - 1;
end;

function isEmptyStack (S: Stack): Boolean;
begin
  Result := (S.size = 0);
end;

var
  input, output: text;
  x: integer;
  S: Stack;

begin
  
  S.size := 0;
  
  Assign(input, 'V:\chisla vxod.txt');
  Assign(output, 'V:\chisla vyxod.txt');
  Reset(input);
  Rewrite(output);
  
  while not EOF(input) do begin
    Readln(input, x);
    Push(S, x);
  end;
  
  If isEmptyStack(S) then writeln('Стек пуст')
  Else
  Begin
  While (S.size > 0) do
    writeln(output, Pop(s));
  end;
  Close(input);
  Close(output);
end.
