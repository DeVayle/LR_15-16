program lr15_1;

var i: integer; i_ptr: ^integer;

begin
  i:=2;
  new(i_ptr);
  i_ptr^ := i;
  writeln(i_ptr^);
  dispose(i_ptr);
end.