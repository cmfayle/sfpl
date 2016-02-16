/**
 * Created by fayle on 2/12/2016.
 */

public with sharing class VNET_SiteOrdersController {
    public Account              site { get; set; }
    public List<Opportunity>    orders { get; set; }

    public VNET_SiteOrdersController() {
        orders = new List<Opportunity>();
        String siteId = ApexPages.currentPage().getParameters().get('siteId');
        site = [SELECT Id, BE__c, Name, Site_Identifier__c, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode
                FROM Account WHERE Id = :siteId];
    }

    public void searchOrders() {
        orders = [SELECT Id, Name, Project__r.Name, Request_Name__c, Site_AU__c, Store_AU__c
                    FROM Opportunity WHERE AccountId = :site.Id];
    }
}