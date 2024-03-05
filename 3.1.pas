const
  MAXSIZE = 20;

type PNode = ^Node;
     Node = record
       data: integer;
       next: PNode;
     end;
type Queue = record
       head, tail: PNode;
     end;

procedure Push( var Q: Queue; x: integer );
var NewNode: PNode;
begin
  New(NewNode);
  NewNode^.data := x;
  NewNode^.next := Q.head;
  Q.head := newNode;
end;

function Pop ( var Q: Queue ): integer;
var top: PNode;
begin
  if Q.head = nil then begin
    Result := MaxInt;
    Exit;
  end;
  top := Q.head;
  Result := top^.data;
  Q.head := top^.next;
  if Q.head = nil then Q.tail := nil;
  Dispose(top);
end;

var
  input, output: text;
  x: integer;
  Q: Queue;

begin
  Assign(input, 'C:\Users\dmitr\OneDrive\Документы\chisla vxod.txt');
  Assign(output, 'C:\Users\dmitr\OneDrive\Документы\chisla vyxod.txt');
  Reset(input);
  Rewrite(output);
  
  Q.head := nil;
  Q.tail := nil;
  
  while not EOF(input) do begin
    Readln(input, x);
    Push(Q, x);
  end;
  
  While (Q.head <> nil) do
    writeln(output, Pop(q));
  
  Close(input);
  Close(output);
end.

