uses crt;
type pnode = ^data;
     data  = record
       isi : char;
        L, R : pnode;
     end;

    TTo = object
        tree : pnode;
        procedure create;
        function baru(el : char):pnode;
        procedure insert(var temp : pnode; el : char);
        procedure input; procedure cetak;
        procedure preorder(akar : pnode);
        procedure inorder(akar : pnode);
        procedure postorder(akar : pnode);
     end;

procedure TTo.create;
begin
   clrscr;
   tree := nil;
   writeln('Tree sudah kosong');
   readkey;
end;

function TTo.baru(el : char):pnode;
var
   b : pnode;
begin
   new(b);
   b^.isi := el;
   b^.r   := nil;
   b^.l   := nil;
   baru   := b;
end;

procedure TTo.insert(var temp : pnode; el : char);
var
   pil : char;
begin
   if temp = nil then
      temp := baru(el)
   else
   begin
      writeln('Penunjuk di => ',temp^.isi);
      write('Kiri (L) atau Kanan (R) : ');
      readln(pil);
      if upcase(pil) = 'L' then
         insert(temp^.l,el)
      else if upcase(pil) = 'R' then
         insert(temp^.r,el);
   end;
end;

procedure TTo.input;
var
   c : char;
begin
      clrscr;
      write('input data : ');readln(c);
      insert(tree, c);
      writeln;
      writeln('Data masuk di Tree');
      readkey;
end;

procedure TTo.cetak;
begin
   write('Preorder : ') ;preorder(tree);
   writeln;
   write('Inorder  : ') ;inorder(tree);
   writeln;
   write('postorder : ') ;postorder(tree);
   writeln;
   readkey;
end;

procedure Tto.preorder(akar : pnode);
begin
   if akar <> nil then
   begin
      write(akar^.isi:2);
      preorder(akar^.l);
      preorder(akar^.r);
   end;
end;
 Procedure Tto.InOrder(Akar : PNode);
  Begin
    If Akar <> Nil Then
      Begin
        InOrder(Akar^.L);
        Write(Akar^.isi:2);
        inorder(Akar^.R);
      End;
  End;

  Procedure Tto.PostOrder(Akar : PNode);
  Begin
    If Akar <> Nil Then
      Begin
        PostOrder(Akar^.L);
        postorder(akar^.r);
        Write(akar^.isi:2);
      End;
  End;

var
   t : TTo;
   pil : integer;
begin
   repeat
   clrscr;
   writeln('MENU UTAMA');
   writeln;
   writeln('1. Inisialisasi');
   writeln('2. Isi data');
   writeln('3. Tampilan kunjungan');
   writeln('4. Keluar');
   writeln;
   write('Pilihan [1..4] : ');readln(pil);
   with t do
   case pil of
   1 : create;
   2 : input;
   3 : cetak;
   end;
   until pil = 4;
end.
