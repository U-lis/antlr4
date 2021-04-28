public class ShortToUnicodeString extends ArrayInitBaseListener {
    // Translate { to "
    @Override
    public void enterInit(ArrayInitParser.InitContext ctx) {
        System.out.print('"');
    }

    // Translate } to "
    @Override
    public void exitInit(ArrayInitParser.InitContext ctx) {
        System.out.print('"');
    }

    // Translate integers to 4-digit hexadecimal strings with prefix \\u
    @Override
    public void enterValue(ArrayInitParser.ValueContext ctx) {
        // Assumes not nested array inits
        int value = Integer.parseInt(ctx.INT().getText());
        System.out.printf("\\u%04x", value);
    }
}