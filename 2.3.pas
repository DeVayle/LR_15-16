program lr15_2_3;

type
  PNode = ^Node;{ Определяем тип указателя на узел }
  Node = record { Определяем сам узел }
    Elem: Integer; { Информация в узле }
    Next: PNode; { Указатель на следующий узел в списке }
  end;

var
  newNode, head, tail, pp: pNode; max, min, n: integer;

begin
  Write('Введите количество элементов списка: ');
  Read(n);
  if n <= 0 then writeln('Ты дурак?')
  else
  begin
  for var i := 1 to n do
  begin
    new(newNode);
    newNode^.elem := random(1, 100); // Задаем значение новому элементу
    newNode^.next := nil; // Устанавливаем указатель на следующий элемент в nil
    if head = nil then head := newNode // Если список пуст, новый элемент становится головой
    else
    begin
      tail := head;
      while tail^.next <> nil do
        tail := tail^.next;  // Проходим до последнего элемента списка
      tail^.next := newNode; // Связываем последний элемент с новым элементом
    end;
    writeln(newNode^.elem);
  end;
  
  pp := head;
  max := pp^.elem;
  min := pp^.elem;
  while (pp <> nil) do
  begin
    if (max < pp^.elem) then
      max := pp^.elem;
    if (min > pp^.elem) then
      min := pp^.elem;
    pp := pp^.next;
  end;
  Writeln;
  Writeln('Максимальный элемент: ', max);
  Writeln('Минимальный элемент: ', min);
  end;
end.