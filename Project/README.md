Tasks:

Please select a real-world goal that includes database management component:

This can be a company from an industry where you have experience and/or an industry that you are passionate about (Such as: Fidelity, United Health, Walmart) 

Or, alternatively, this can be a technical idea you would like to start and turn into a project but never found the opportunity (Such as: A new app or a system you want to develop)

Review publicly available information and then articulate what you believe should be the data management strategy, including the benefits that will come from this strategy

For this part of the project, you should be guided by the discussions we had in class to motivate the value of this project

You will want to be able to justify this decision and briefly share your reasoning during your presentation

This is a suitable step to prepare one (or more) motivation slide for your presentation

For the selected company (or idea), hypothesize 3 transaction management applications that you believe this company needs to run their business.

Examples of transaction management application include software solutions to support business processes such as order processing, accounts receivables, accounts payables, fixed asset management, inventory management, and call center operations

Figure out information requirements (Entities and Attributes)

For each of these applications, articulate the data model of the relational database that supports the application using LucidChart (or any other ER diagram tool we used in HW1)

Please keep in mind that the workload supported by a transactional database involves, for the most part, single row inserts and updates and simple read queries that do not include many joins

Write the DDL for this data model and implement this model in Oracle

Next, either using publicly available data or manually created data, seed the tables with data. You will not be evaluated on the volume of seeded data

This is a suitable step to prepare an ERD slide for your presentation

Use the 3 transactional databases created in the previous step, to design the data model for an enterprise data warehouse for this company using LucidChart.

If you need more information on DW Design and ETL, read the file I posted on data warehousing Download the file I posted on data warehousing

You can also find the file under Canvas/Files/381 Class 23 Reading - DW Design and ETL.pdf Download 381 Class 23 Reading - DW Design and ETL.pdf

Please keep in mind that the workload supported by an enterprise data warehouse involves, for the most part, high volume batch inserts and complex queries that involve multiple joins

Write the DDL for the enterprise data warehouse data model and implement it in Oracle

Develop the ETL that will source the data from the 3 transactional databases and populate the data in the date warehouse in Oracle

Articulate and document the ETL decisions you are making in this process

This is a suitable step to start preparing the code and technical slides on the database design

Starting with the enterprise data warehouse, select a subset of data to create a data lake

This section might use a NoSQL database of your choice (you don't actually implement anything but if your information requirements include non-relational data include this in your slides)

Articulate the rationale for the subset of data that you have selected

Augment the data lake with additional data elements that are required for the specific purpose of the data lake (For example, if the data lake is for marketing what other data elements or denormalizations will you need to develop to make the data lake easy to use for marketing)

This is a suitable step to prepare a "Beyond Relational" slide for your presentation

Connect this project to the other courses

Implement at least two learnings from your other courses to this project (For example, you can include analysis patterns against this data lake from your machine learning or other courses)

Articulate the importance and value from the analysis and relate it back to the benefits we were expecting from the data strategy

Critically reflect on your learning from executing this final project

Answer the following questions:

What did you learn?

What was most valuable?

How can you use this learning going forward?

What are additional opportunities for learning that this project did not capture?

How can we change this project to capture these opportunities?

Come to class and present. More importantly, have fun

Deliverables (You will present this project)
You will present this project, in-class, with your team. There is no chance to change the dates after we set them because this is the end of the semester

You will turn in (submit) the presentation slides along with any code you wrote

Obviously, you will prepare presentation slides (typically MS PowerPoint but any other common presentation tool is acceptable)

You will use these slides to present your final project in class, and then you will submit them under the Canvas assignment

Presentation should be 10 minutes maximum

Script in a (.sql) file format. If you have issues doing this, at least save it as a .txt file. Do not submit in any other format other than .sql and .txt.

Save your code into one SQL file with the naming format: Group_Number.SQL. Please make sure the team number you use matches what is in Canvas/People/Groups. For example: Team_1.SQL

Save your file either as a .sql file or as a .txt file

I recommend submitting both files before you present. I would be fine with a little delay such as a few hours later the same day, but please do not delay Canvas submission. If I don't see any files during grading, your entire team can get a zero.
