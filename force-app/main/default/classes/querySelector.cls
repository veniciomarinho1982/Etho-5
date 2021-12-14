public with sharing class querySelector {
    public static String getQueryAllSelector(String e, String f) {
        return 'SELECT ' + f + ' FROM ' + e;
    }

    public static String getQueryWhereSelector(String e, String f,String condicao) {
        return 'SELECT ' + f + ' FROM ' + e + ' WHERE '+ condicao; 
    }
}