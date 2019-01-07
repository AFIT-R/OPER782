Syllabus of Instruction
================

<style>
p {margin-bottom: 0px !important;}
table { border: 0 !important;
        border-spacing: 2px !important;
        border-collapse: separate !important;
}
</style>

<font size="6">

<center>

**OPER 782**

</center>

</font> <font size="5">

<center>

Data Science Practice

</center>

</font> <font size="4">

<center>

Three Graduate Quarter Hours Credit

</center>

</font> <br> <font size="4">

<center>

Winter Quarter

</center>

</font> <font size="4">

<center>

2 Jan 2019 - 8 Mar 2019

</center>

</font> <br> <font size="5">

<center>

Graduate School of Engineering and Management

</center>

</font> <font size="5">

<center>

Air Force Institute of Technology

</center>

</font> <font size="5">

<center>

Air Education and Training Command

</center>

</font> <br/>

<table border="0">

<tr>

<td>

**Instructor:**

</td>

<td>

Maj. Jason K. Freels, PhD

</td>

</tr>

<tr>

<td>

**Office:**

</td>

<td>

Bldg 640, Rm 205A

</td>

</tr>

<tr>

<td>

**Email:**

</td>

<td>

<jason.freels@afit.edu>

</td>

</tr>

<tr>

<td>

</td>

<td>

<jasonkfreels@gmail.com>

</td>

</tr>

<tr>

<td>

**Phone:**

</td>

<td>

937 255-3636 ext. 4676

</td>

</tr>

<tr>

<td>

</td>

<td>

937 430-6619

</td>

</tr>

<tr>

<td>

**Office Hours:**

</td>

<td>

TBD

</td>

</tr>

</table>

### Course Overview

Data Science is the study of the generalizable extraction of knowledge
from data. Being a data scientist requires an integrated skill set
spanning operations research, statistics, and computer science along
with a good understanding of crafting a problem formulation for
effective solutions. In this course, students will use these skills to
explore various methods of integrating data and algorithms into an
operationalized analytic data product (aka ‘analytic’). Using these
methods, students will develop and deploy their own analytic in the form
of an R package with an embedded interactive Shiny application/gadget.

### Course Objectives

The primary objective of this course is to ensure that students can
implement & integrate various tools for developing analytic data
products that allow end-users to make better decisions. More generally,
at the completion of the course, each student should be able to: <br> 1.
Understand the importance of deploying analytic data products 2.
Describe various approaches to deploying analytic data products 3.
Operationalize analyses by developing a Shiny application or Shiny
gadget 4. Operationalize analyses by developing R packages 5. Prioritize
efforts to develop analytic data products under time contraints 6.
Relate the knowledge and skills learned in this course to decision
making processes within the Air Force and/or DoD.

### Textbook

No textbook is required for this course, but occasional readings will be
assigned

### Required Materials

<u>Students registered for this course are expected to have their own
project to serve as the basis for developing an analytic data
product.</u> This requirement is in place because it can be very
difficult for students to understand the methods presented in this
course without a concrete problem to which these methods can be applied.

Students may request to work together on a project with another student
in the class. These requests must be submitted in writing (via email) to
the instructor and must include (a) the names of each person wishing to
work together (b) a description of the project and (c) an explanation
detailing why a group effort is needed.

Students who do not have a project, may request to be assigned a project
from the instructor. Requests for topics must be submitted in writing
(via email) to the instructor and must include (a) the name of the
person making the request and (b) a description of the requestor’s
thesis topic.

# Analytic Deployment Review

Part of the analytic development process is ensuring that the algorithms
you develop will be reproducible and portable for an end-user. Often an
end-user’s machine is not configured in the same way as the developer’s
- leading to unexpected side effects or errors. To ensure that your
methods are reproducible & portable, your analytic data products will be
reviewed on multiple ‘new’ machines representing those used by potential
end-users. In lieu of a final exam, each student will be tasked to
review two analytic projects developed by students in the course. Using
the information presented in the GitHub repository README file and any
documentation files provided with the analytic, the reviewer will review
the analytic in these areas:

  - Accuracy
    
      - Are the results accurate?
      - Is it clear how the results were computed?

  - Compilation
    
      - Did the analytic work? (i.e. install correctly, startup
        correctly)
      - Were errors encountered when executing code according to the
        documentation?

  - Ease of use
    
      - Is it clear how to use the analytic? (i.e. is the documentation
        clear)
      - Are the visualizations/plots interpretable?

Reviewers will capture their findings by (1) generating an issue on the
analytic project’s Github page for each finding and (2) present all
findings in a final report (.Rmd file & html\_document). Both the report
and the Github issues should include a brief discussion of the problem
with one or more reproducible examples.

After reviewing the analytic, the reviewer will then assign it one of
the following grades. **Note: I will perform a second review on all
projects to ensure that grades are assigned fairly. If my final grade
differs greatly from the grade provided by the reviewer - it will be an
indication of poor engagement by the reviewer.**

  - Outstanding - ready to publish/deploy (50 pts)
    
      - All proposal tasks completed
      - Documentation is thorough and clear
      - No errors or warnings during build/use

  - Excellent - very little rework required (45 pts)
    
      - Few proposal tasks incomplete
      - Documentation is clear and mostly complete
      - Minor errors or warnings during build/use

  - Satisfactory - extensive rework required (40 pts)
    
      - Several proposal tasks incomplete
      - Documentation is limited and/or poorly written
      - Severe errors during build or in use

  - Unsatisfactory- complete restart required (35 pts)
    
      - Little progress made on proposal tasks
      - Little to no documentation
      - Cannot be compiled, unusable

The table below lists each developer, the URL of their respective
project, and the assigned
reviewers.

| Developer | Git\_URL                                              | Reviewer1 | Reviewer2 |
| :-------- | :---------------------------------------------------- | :-------- | :-------- |
| Uhorchak  | <https://github.com/nuhorchak/RClean>                 | Butt      | Smith     |
| Munson    | <https://github.com/evan-l-munson/SAoTD>              | Kalhoff   | Gallagher |
| Ramirez   | <https://github.com/RachelRamirez/NPS>                | Smith     | Sevier    |
| Smith     | <https://github.com/JSmith146/CoRpEx>                 | Sevier    | Johnson   |
| Trigo     | <https://github.com/citation891/MCAC>                 | Stuntz    | Uhorchak  |
| Kalhoff   | <https://github.com/AFIT-R/instaExtract>              | Meyer     | Butt      |
| Butt      | <https://github.com/SpencerButt/IDPS-LAAD>            | Munson    | Ramirez   |
| Elliott   | <https://github.com/jtelliott/attrition-forecast>     | Uhorchak  | Munson    |
| Johnson   | <https://github.com/slackliner33/Yahoo_DFS_Optimizer> | Elliott   | Kalhoff   |
| Sevier    | <https://github.com/williamcsevier/TextML>            | Small     | Meyer     |
| Small     | <https://github.com/msmall318/Boots>                  | Johnson   | Trigo     |
| Gallagher | <https://github.com/gallagherj2008/SWAT>              | Trigo     | Small     |
| Stuntz    |                                                       | Gallagher | Ramirez   |
| Meyer     | <https://github.com/AFIT-R/MODA>                      | Ramirez   | Elliott   |

List of developers, projects, and assigned reviewers for OPER782 (Winter
2018)

The assigned reviewers are to:

1.  Download the project using
    `devtools::install_github('devname/projectname')`

2.  Review the documentation provided

3.  Test out the project in accordance with the documentation

4.  Write a one-page review of the project using the rubric provided
    above.

5.  Fork the project repository

6.  Add your review to the inst/ directory of the project

7.  Submit a pull request to the project developer to have them include
    the review as part of their project.
