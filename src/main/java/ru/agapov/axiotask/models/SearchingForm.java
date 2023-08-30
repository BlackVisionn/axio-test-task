package ru.agapov.axiotask.models;

public class SearchingForm {

    private int searchType;
    private String searchingValue;

    public String[] parsePassportData() {
        String[] result = new String[2];

        if (searchType == 2 && searchingValue != null) {
            searchingValue = searchingValue.replaceAll(" ", "");
            if (searchingValue.length() == 10) {
                result[0] = searchingValue.substring(0, 4);
                result[1] = searchingValue.substring(4, 10);
            }
        }

        return result;
    }

    public int getSearchType() {
        return searchType;
    }

    public void setSearchType(int searchType) {
        this.searchType = searchType;
    }

    public String getSearchingValue() {
        return searchingValue;
    }

    public void setSearchingValue(String searchingValue) {
        this.searchingValue = searchingValue;
    }
}
