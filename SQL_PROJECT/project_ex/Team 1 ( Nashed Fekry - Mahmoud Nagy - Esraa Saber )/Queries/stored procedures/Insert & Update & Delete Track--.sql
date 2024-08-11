
create proc add_New_track (@id int,@name nvarchar(max))
as 
  begin
      begin try
	   insert into Track values(@id,@name)
	  end try
	  begin catch
	  select 'dublicated id '
	  end catch
  end

  select * from Track
  exec add_New_track 7,'AI'

create proc upadte_track_Name (@id int,@name nvarchar(max))
as 
  begin
      begin try
	   update Track
	   set Track_Name=@name
	   where Track_ID=@id
	  end try
	  begin catch
	  select 'not found '
	  end catch
  end

    select * from Track
	  exec upadte_track_Name 7,'HR'

create proc delete_track (@id int)
as 
  begin
      begin try
	 delete from Track
	 where Track_ID=@id
	  end try
	  begin catch
	  select 'not found '
	  end catch
  end

  exec delete_track 7
  select * from Track
