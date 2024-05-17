data permessi;
	infile "Y:\My Drive\dati\permessi.csv" firstobs=2 dlm=',' dsd;
	input Permit_Number :$99. Permit_Type Permit_Type_Definition :$99. 
	Permit_Creation_Date :MMDDYY10. 
	Block $ Lot $ Street_Number Street_Number_Suffix :$99. Street_Name :$99. Street_Suffix :$99. 
	Unit :$99. 
	Unit_Suffix :$99. Description :$99. Current_Status :$99. Current_Status_Date :$12. 
	Filed_Date :MMDDYY10. Issued_Date :MMDDYY10. 
	Completed_Date :MMDDYY10. First_Construction_Document_Date :MMDDYY10. 
	Structural_Notification :$99.
	Number_of_Existing_Stories Number_of_Proposed_Stories Voluntary_Soft_Story_Retrofit 
	Fire_Only_Permit $ Permit_Expiration_Date :MMDDYY10. Estimated_Cost Revised_Cost 
	Existing_Use :$99.
	Existing_Units :$99. Proposed_Use :$99. Proposed_Units Plansets TIDF_Compliance 
	Existing_Construction_Type :$99. Existing_Construction_Type_Descr :$99.
	Proposed_Construction_Type :$99. Proposed_Construction_Type_Descr :$99. Site_Permit :$99.
	Supervisor_District Neighborhoods_Analysis_Bounds:$99. Zipcode :$11. Location:$99. 
	Record_ID :$99.;

run;