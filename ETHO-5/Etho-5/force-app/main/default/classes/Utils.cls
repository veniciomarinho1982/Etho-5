public without sharing class Utils {
    public static void setValue(SObject record, Schema.SObjectField field, Object value) {
        record.put(field, value);
    }

    public static Set<Id> getSetIds(List<SObject> sObjs, Schema.SObjectField field) {
        Set<Id> ids = new Set<Id>();

        for (SObject sObj : sObjs) {
            ids.add(Id.valueOf(String.valueOf(sObj.get(field))));
        }

        return ids;
    }

    //TODO: desenvolver esse cálculo aleatório.
    //retornar número aleatório entre X e Y (inclusivo)
    //x <= retorno <= y
    public static Integer generateRandomIntegerBetween(Integer x, Integer y) {
        
        // definir valores minimos e maximo
        int min = x; // inclusive
        int max = y; // exclusive

        // Gerar um double entre min e max
        double randomDouble = Math.random() * (max - min + 1) + min;
      
        // Gerar um inteiro entre min e max
        int randomInt = (int) (Math.random() * (max - min + 1) + min);
                
        return (y - x);
    }

    public static void main(String[] args) {
      
    }
}