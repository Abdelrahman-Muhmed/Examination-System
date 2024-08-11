
----------------------------------------
-- Insert & Update & Delete Course

--Add Course
create or Alter proc add_New_Course   @minDegree int, @maxDegree int,@name nvarchar(50),@desc nvarchar(200)
as
begin
	insert into Course
	values ( @minDegree , @maxDegree , @name, @desc )
end

go

exec add_New_Course 60, 20, 'python', 'used for web and artificial intelligence'
select * from Course

--update Name
create or Alter proc update_Course_Name @crsId int, @name nvarchar(50)
as
begin
	update Course
	set Name = @name
	where Course_ID = @crsId;
end

go
exec update_Course_Name 5, 'python';
select * from Course


--update Decr
go
create or Alter proc update_Course_Description @crsId int, @desc nvarchar(200)
as
begin
	update Course
	set Description = @desc
	where Course_ID = @crsId;
end

exec update_Course_Description 7, 'ay7aga';
select * from Course


--Update min & Max Degree
create or Alter proc update_Course_min_Max_Degree @crsId int, @minDegree int, @maxDegree int
as
begin
	update Course
	set Min_Degree = @minDegree,  Max_Degree= @maxDegree
	where Course_ID = @crsId;
end

exec update_Course_min_Max_Degree 7,1,100;
select * from Course

--delete Course
go
create or Alter proc delete_Course @crsId int
as
begin
	delete from Course where Course_ID = @crsId;
end

go
exec delete_Course 7
select * from Course