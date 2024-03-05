program lr15_2_2;

  type
    PNode = ^Node; { Определяем тип указателя на узел }
    Node = record { Определяем сам узел }
      Count: Integer; { Номер узла }
      Elem: String;
      Next: PNode; { Указатель на следующий узел в списке }
    end;

var
    newNode, head, tail: pNode;
    alf: array [1..10] of string = ('арбуз', 'банан', 'виноград', 'груша', 'дыня', 'ежевика', 'жимолость', 'земляника', 'инжир', 'йогурт?');
    
begin
  writeln('весь список:');
  for var i:=1 to 10 do
    begin
  new(newNode);
  newNode^.elem := alf[i];// Задаем значение новому элементу
  newNode^.count := i;
  newNode^.next := nil;      // Устанавливаем указатель на следующий элемент в nil
  
  if head = nil then head := newNode        // Если список пуст, новый элемент становится головой
  else
  begin
    tail := head;
    while tail^.next <> nil do
      tail := tail^.next;  // Проходим до последнего элемента списка

    tail^.next := newNode; // Связываем последний элемент с новым элементом
  end;
  writeln(newNode^.elem);
    end;
      writeln;
      writeln('четные элементы списка:');
   var pp := Head;
   while (pp <> nil) do 
   begin
     if (pp^.count mod 2 = 0) then writeln (pp^.elem);
     pp := pp^.next;
   end;
  end.