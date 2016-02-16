/**
 * Created by fayle on 2/12/2016.
 */

public with sharing class VNET_SearchSitesController {
    public Account          searchData { get; set; }
    public List<Account>    searchResults { get; set; }

    public VNET_SearchSitesController() {
        searchData      = new Account();
        searchResults   = new List<Account>();
    }

    public void searchSites() {
        String  siteQuery = '';
        Boolean whereClause = false;
        siteQuery += 'SELECT Id, BE__c, Name, ShippingStreet, Site_Identifier__c, ShippingCity, ShippingState, ShippingPostalCode ';
        siteQuery += 'FROM Account';
        if (searchData.BE__c != null) {
            siteQuery += ' WHERE ';
            siteQuery += 'BE__c LIKE \'%' + searchData.BE__c + '%\'';
            whereClause = true;
        }
        if (searchData.Name != null) {
            if (!whereClause) { siteQuery += ' WHERE '; whereClause = true; }
            else { siteQuery += ' AND '; }
            siteQuery += 'Name LIKE \'%' + searchData.Name + '%\'';
        }
        if (searchData.Site_Identifier__c != null) {
            if (!whereClause) { siteQuery += ' WHERE '; whereClause = true; }
            else { siteQuery += ' AND '; }
            siteQuery += 'Site_Identifier__c LIKE \'%' + searchData.Site_Identifier__c + '%\'';
        }
        if (searchData.ShippingStreet != null) {
            if (!whereClause) { siteQuery += ' WHERE '; whereClause = true; }
            else { siteQuery += ' AND '; }
            siteQuery += 'ShippingStreet LIKE \'%' + searchData.ShippingStreet + '%\'';
        }
        if (searchData.ShippingCity != null) {
            if (!whereClause) { siteQuery += ' WHERE '; whereClause = true; }
            else { siteQuery += ' AND '; }
            siteQuery += 'ShippingCity LIKE \'%' + searchData.ShippingCity + '%\'';
        }
        if (searchData.ShippingState != null) {
            if (!whereClause) { siteQuery += ' WHERE '; whereClause = true; }
            else { siteQuery += ' AND '; }
            siteQuery += 'ShippingState LIKE \'%' + searchData.ShippingState + '%\'';
        }
        if (searchData.ShippingPostalCode != null) {
            if (!whereClause) { siteQuery += ' WHERE '; whereClause = true; }
            else { siteQuery += ' AND '; }
            siteQuery += 'ShippingPostalCode LIKE \'%' + searchData.ShippingPostalCode + '%\'';
        }

        searchResults = Database.query(siteQuery);

        System.debug('siteQuery = ' + siteQuery);
        System.debug('searchResults.size() = ' + searchResults.size());
    }
}