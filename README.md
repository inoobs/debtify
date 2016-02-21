## README

## Summary 

Deptify - bills management as a service.

Do you have enough of managing different financial payouts?
Do you have enough of managing the payouts in different banks, accounts?
Do you have enough to forget to pay something in time?

If one of the questions answer is "yes", than you need Deptify.
Deptify helps you organize your payouts. 
Deptify helps you easily setup your payments for different accounts.
With Deptify you can add easily add new payments even if it a one-time or regular payment.
Deptify sends you notification for the next payment via Gmail or other developed microservice.
On Deptify you can see all of your payments in one page.

Deptify is fully open source project and the plug-ins availability is growing every day.

## Debtify

Debtify is a core application which handles logins, plug-ins and payments. 
As an open source project anybody can develop a new plug-in for it. The core app communicates with the plugins and gives the DB background for them. 

Debtify built with Rails 5 and Ruby 2.3.0. The database behind is Postgresql 9.4 accessable only for Debtify.

## Plug-ins

The plug-ins of the Debtify works as microservices helping the easy development. You can find the plug-ins on github (https://github.com/inoobs), but if you log in to the Deptify, you can see the list of the available plug-ins and you can easily turn them on/off.

For the details of each pluging please look at their README.md file.

## Note

This project started during the 2016 hack.summit() hackathon.

Thank you!
