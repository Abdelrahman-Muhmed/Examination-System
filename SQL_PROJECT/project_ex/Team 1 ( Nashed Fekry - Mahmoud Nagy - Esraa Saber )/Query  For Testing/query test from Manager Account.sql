----Test branch from Mangar Account
--=======================================

---insert 
--Pass New branch name
EXEC add_New_Branch 'Assuit'
SELECT *FROM branch_view
---Update or Delete
---Pass branchID & branchName & Action ( update or delete )

--(1) update
EXEC Branch_Action_Update_Or_Delete
   @BranchID = 8,
   @BranchName='Louxor',
   @Action = 'UPDATE';
SELECT *FROM branch_view

--(2) delete
EXEC Branch_Action_Update_Or_Delete
   @BranchID = 8,
   @Action = 'DELETE';
SELECT *FROM branch_view




----Test Track from Mangar Account
--=======================================

---insert 
--Pass New trackID & TrackName
exec add_New_track 7,'AI'
SELECT *FROM track_view.

---Update 
--Pass trackID & TrackName
exec upadte_track_Name 7,'HR'
SELECT *FROM track_view.

---delete 
--Pass trackID
exec delete_track 7
SELECT *FROM track_view.




----Test Intake from Mangar Account
--=======================================

---insert 
--Pass New IntakeID & IntakeName
EXEC add_New_Intake 7,'C++'
SELECT *FROM Intake_view


---Update or Delete
---Pass branchID & branchName & Action ( update or delete )

--(1) update
EXEC Intake_Action_Update_Or_Delete
    @IntakID = 7,
	@IntakName='any',
	@Action = 'UPDATE';
SELECT *FROM Intake_view


--(2) delete
EXEC Intake_Action_Update_Or_Delete
    @IntakID = 7,
	@Action = 'DELETE';
SELECT *FROM Intake_view

