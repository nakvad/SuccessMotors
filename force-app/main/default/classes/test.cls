public class test {
    public static void createPriceBookEntries() {
        List<Product2> products = [SELECT Id FROM Product2];
        Pricebook2 standardPb = [SELECT Id FROM Pricebook2 WHERE NAME = 'PriceBookForProducts'];
        List<PricebookEntry> entriesToInsert = new List<PricebookEntry>();
        for(Product2 prod : products) {
            PricebookEntry pbe = new PricebookEntry();
            pbe.Product2Id = prod.Id;
            pbe.Pricebook2Id = standardPb.Id;             
            Decimal randomPrice = Math.round(Math.random() * 10000) / 100;
            pbe.UnitPrice = randomPrice;
            pbe.IsActive = true;
            entriesToInsert.add(pbe);
        }
        
        try {
            insert entriesToInsert;
        } catch (Exception e) {
            System.debug('Ошибка при вставке PriceBookEntry: ' + e.getMessage());
        }
    }
}