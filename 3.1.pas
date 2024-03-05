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

procedure PushTail( var Q: Queue; x: integer );
var NewNode: PNode;
begin
  New(NewNode);
  NewNode^.data := x;
  NewNode^.next := nil;
  if Q.tail <> nil then
    Q.tail^.next := NewNode;
  Q.tail := NewNode; 
  if Q.head = nil then Q.head := Q.tail;
end;

function Pop ( var Q: Queue ): integer;
var top, previous: PNode;
begin
  if Q.head = nil then begin
    Result := MaxInt;
    Exit;
  end;
  top := Q.tail;
  Result := top^.data;
  if Q.head = Q.tail then
  begin
    Q.head := nil;
    Q.tail := nil;
  end
  else
  begin
    previous := Q.head;
    while previous^.next <> Q.tail do
      previous := previous^.next;
    Q.tail := previous;
    Q.tail^.next := nil;
  end;
  Dispose(top);
end;

var
  input, output: text;
  x: integer;
  Q: Queue;

begin
  Assign(input, '1.txt');
  Assign(output, '2.txt');
  Reset(input);
  Rewrite(output);
  
  Q.head := nil;
  Q.tail := nil;
  
  while not EOF(input) do begin
    Readln(input, x);
    PushTail(Q, x);
  end;
  
  While (Q.head <> nil) do
    writeln(output, Pop(q));
  
  Close(input);
  Close(output);
end.
