----------------------------------------
-- Insert & Update & Delete Student

--Insert
create or alter proc add_New_Student @Id int, @name nvarchar(max), @age int
as
begin
	insert into Students (Std_ID,Std_Name,Std_Age)
	values (@Id,@name, @age)
end

go
exec add_New_Student 7,'Sam', 23
select * from Students




--update Std Name
create or alter proc update_Student_Name @ID int, @name nvarchar(max)
as
begin
	update Students
	set Std_Name = @name
	where Std_ID = @ID;
end
exec update_Student_Name 2,'Mahmoud Nagy'
select * from Students


--update Std Age
create or alter proc update_Student_Age @name nvarchar(max), @age nvarchar(50)
as
begin
	update Students
	set Std_Age = @age
	where Std_Name = @name;
end

exec update_Student_Age 'Ayman Magdy',17
select * from Students


--delete Std
go
create or Alter proc delete_Student @stdId int
as
begin
	delete from Students where Std_ID = @stdId;
end

go
exec delete_Student 7
select * from Students
