﻿program T1;

type
  PNode = ^Node;
  Node = record
    _Word: string;
    Counter: integer;
    Next: PNode;
  end;

var
  Head, NewNode, q: PNode;
  Counter: integer;
  w: string;
  f: text;

function GetWord(f: text): string;
var
  c: char;
begin
  Result := '';
  c := ' ';
  while not (EOF(f)) and (c <= ' ') do
    Read(f, c);
  while not (EOF(f)) and (c >  ' ') do
  begin
    Result += c;
    Read(f, c);
  end;
end;

function Find(Head: PNode; NewWord: string): PNode;
var
  q: PNode;
begin
  q := Head;
  while (q <> nil) and (q^._Word <> NewWord) do
    q := q^.Next;
  Result := q;
end;

function CreateNode(NewWord: string): PNode;
var
  NewNode: PNode;
begin
  New(NewNode);
  NewNode^._Word   := NewWord;
  NewNode^.Counter := 1;
  NewNode^.Next    := nil;
  Result := NewNode;
end;

function FindPlace(Head: PNode; NewWord: string): PNode;
var
  q: PNode;
begin
  q := Head;
  while (q <> nil) and (NewWord > q^._Word) do
    q := q^.Next;
  Result := q;
end;

procedure AddFirst(var Head: PNode; NewNode: PNode);
begin
  NewNode^.Next := Head;
  Head          := NewNode;
end;

procedure AddAfter(p, NewNode: PNode);
begin
  NewNode^.Next := p^.Next;
  p^.Next       := NewNode;
end;

procedure AddBefore(var Head: PNode; p, NewNode: PNode);
var
  q: PNode;
begin
  q := Head;
  if (p = Head) then
    AddFirst(Head, NewNode)
  else begin
    while (q <> nil) and (q^.Next <> p) do
      q := q^.Next;
    if (q <> nil) then
      AddAfter(q, NewNode);
  end;
end;

begin
  Head := nil;
  Assign(f, 'C:\Users\dmitr\OneDrive\Документы\Sslovakia.txt'); Reset(f);
  
  while True do
  begin
    w := GetWord(f);
    if (w = '') then 
      break;
    q := Find(Head, w);
    if (q <> nil) then
      Inc(q^.Counter)
    else begin
      NewNode := CreateNode(w);
      q := FindPlace(Head, w);
      AddBefore(Head, q, NewNode);
    end;
  end;
  
  Close(f);
  Assign(f, 'C:\Users\dmitr\OneDrive\Документы\output.txt'); 
  Rewrite(f);
  q := Head;
  Counter := 0;
  
  while (q <> nil) do
  begin
    Inc(Counter);
    Writeln(f, q^._Word, ': ', q^.Counter);
    q := q^.Next;
  end;
  
  Writeln(f, Counter, ' уникальных слов(а) ');  
  Writeln(Counter, ' уникальных слов(а) ');
  Close(f);
end.