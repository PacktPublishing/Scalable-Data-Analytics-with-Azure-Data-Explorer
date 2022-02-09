# Scalable Data Analytics with Azure Data Explorer

<a href="https://www.packtpub.com/product/scalable-data-analytics-with-azure-data-explorer/9781801078542"><img src="https://static.packt-cdn.com/products/9781801078542/cover/smaller" alt="Scalable Data Analytics with Azure Data Explorer" height="256px" align="right"></a>

This is the code repository for [Scalable Data Analytics with Azure Data Explorer](https://www.packtpub.com/product/scalable-data-analytics-with-azure-data-explorer/9781801078542), published by Packt.

**Modern ways to query, analyze, and perform real-time data analysis on large volumes of data**

## What is this book about?
Azure Data Explorer (ADX) enables developers and data scientists to make data-driven business decisions. This book will help you rapidly explore and query your data at scale and secure your ADX clusters.

This book covers the following exciting features: <First 5 What you'll learn points>
* Become well-versed with the core features of the Azure Data Explorer architecture
* Discover how ADX can help manage your data at scale on Azure
* Get to grips with deploying your ADX environment and ingesting and analyzing your data
* Explore KQL and learn how to query your data
* Query and visualize your data using the ADX UI and Power BI

If you feel this book is for you, get your [copy](https://www.amazon.com/dp/1801078548) today!

<a href="https://www.packtpub.com/?utm_source=github&utm_medium=banner&utm_campaign=GitHubBanner"><img src="https://raw.githubusercontent.com/PacktPublishing/GitHub/master/GitHub.png" 
alt="https://www.packtpub.com/" border="5" /></a>


## Instructions and Navigations
All of the code is organized into folders. For example, Chapter02.

The code will look like the following:
```
StormEvents | where State =~ "California"
| summarize event=count() by EventType | render columnchart
```

**Following is what you need for this book:**
This book is for data analysts, data engineers, and data scientists who are responsible for analyzing and querying their team's large volumes of data on Azure. SRE and DevOps engineers who deploy, maintain, and secure infrastructure will also find this book useful. Prior knowledge of Azure and basic data querying will help you to get the most out of this book.

With the following software and hardware list you can run all code files present in the book (Chapter 1-15).

### Software and Hardware List

| Chapter  | Software required                   | OS required                        |
| -------- | ------------------------------------| -----------------------------------|
| 1        | Visual Studio Code (https://code.visualstudio.com)                | Windows, macOS, and Linux  |
| 2        | Git command-line tools (https://git-scm.com/downloads)        | Windows, macOS, and Linux  |


We also provide a PDF file that has color images of the screenshots/diagrams used in this book. [Click here to download it](https://static.packt-cdn.com/downloads/9781801078542_ColorImages.pdf).

## Code in Action

Click on the following link to see the Code in Action:

[Placeholder link](https://bit.ly/3uw1w2U)

### Related products 
* Limitless Analytics with Azure Synapse [[Packt]](https://www.packtpub.com/product/limitless-analytics-with-azure-synapse/9781800205659) [[Amazon]](https://www.amazon.com/dp/1800205651)

* Cloud Scale Analytics with Azure Data Services [[Packt]](https://www.packtpub.com/product/cloud-scale-analytics-with-azure-data-services/9781800562936) [[Amazon]](https://www.amazon.com/dp/1800562934)

## Get to Know the Author
**Jason Myerscough**
is a director of Site Reliability Engineering and cloud architect at Nuance Communications. He has been working with Azure daily since 2015. He has migrated his company's flagship product to Azure and designed the environment to be secure and scalable across 16 different Azure regions by applying cloud best practices and governance. He is currently certified as an Azure Administrator (AZ-103) and an Azure DevOps Expert (AZ-400). He holds a first-class bachelor's degree with honors in software engineering and a first class master’s degree in computing.
