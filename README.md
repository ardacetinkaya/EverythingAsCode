# EverythingAsCode

[![Build Status](https://miyop.visualstudio.com/miyop/_apis/build/status/EverythingAsCode?branchName=master)](https://miyop.visualstudio.com/miyop/_build/latest?definitionId=11&branchName=master)

_Everything As Code_ is a demostration to show how to move a software solution in a "cloud" platform. It is also a demostration for deployment of the same solution for different customers with different configurations. Like turning a software solution into a product for different customers...

Scenario; Let's assume that we have a software solution.(Ex: ProductX Web Application) And we want to deliver this solution as a product to the customers as a turn-key project. This solution is provided in a "cloud" platform as customer-owned resource, kind of a "cloudification" move as a traditional application migrated from on-premise to cloud.

In this demostration the main ideas are;
- __Infrastructure as Code(IaC)__
- __Continuous integration (CI) and continuous delivery (CD)__


In this demostration the main technolojies are;
- __Terraform__
- __Azure as cloud platform__
- __ASP.NET Core Web Application__
- __Azure DevOps Pipelines and Releases__

Implementation scenario;

- Create Terraform configurations as infrastructure definations on Azure platform
- Create Azure DevOps Pipelines to build and prepare product versions
- Create release flow to apply Terraflow configurations to create infrastructure and application deployment per customer

<p align="center">
    <img src="https://github.com/ardacetinkaya/EverythingAsCode/blob/master/Images/EaC-1.png" height="350px" />
</p>

<p align="center">
    <img src="https://github.com/ardacetinkaya/EverythingAsCode/blob/master/Images/EaC-2.png" />
</p>

## Result ##

A web-based solution can be easily deployed into a cloud platform per customer with different configurations and versions. 

<p align="center">
    <img src="https://github.com/ardacetinkaya/EverythingAsCode/blob/master/Images/EaC-0.png" />
</p>

## Everything as Code ##

Solution as a code, infrastructure as a code, build as a code and deployment as a code.😀




