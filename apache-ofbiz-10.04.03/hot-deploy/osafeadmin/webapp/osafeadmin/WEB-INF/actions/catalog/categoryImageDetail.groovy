package catalog;
import org.ofbiz.base.util.UtilValidate;
if (UtilValidate.isNotEmpty(parameters.productCategoryId)) {
    productCategory = delegator.findOne("ProductCategory",["productCategoryId":parameters.productCategoryId], true);
    context.productCategory = productCategory;
}