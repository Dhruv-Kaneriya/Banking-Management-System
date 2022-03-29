const ck_fname = /^[a-zA-Z]{3,128}$/;
const ck_lname = /^[a-zA-Z]{3,128}$/;
const ck_aadhar = /^[0-9]{12,12}$/;
const ck_mobile = /^[0-9]{10,10}$/;
const ck_address = /^[a-zA-Z0-9\s,.'-]{3,}$/;

function validator(form) {

    const fname = form.fname.value;
    const lname = form.lname.value;
    const aadhar = form.aadhar.value;
    const mobile = form.mobile.value;
    const address = form.address.value;
    const userinput = form.dob.value;


    let errors = [];
    if (!ck_fname.test(fname)) {
        errors[errors.length] = "First Name should only contain alphabets and atleast of size 3!";
    }

    if (!ck_lname.test(lname)) {
        errors[errors.length] = "Last Name should only contain alphabets and atleast of size 3!";
    }

    if (!ck_aadhar.test(aadhar)) {
        errors[errors.length] = "Aadhar Number should be of 12 Digits!";
    }
    if (!ck_mobile.test(mobile)) {

        errors[errors.length] = "Mobile number must be of 10 digits!";
    }

    if (!ck_address.test(address)) {
        errors[errors.length] = "Address should be of atleast size 3 and may contain special symbols out of (\s,.'-)";
    }

    const dob = new Date(userinput);
    if (userinput == null || userinput === '') {
        errors[errors.length] = "Select your Birth Date";

    } else {

        //calculate month difference from current date in time
        const month_diff = Date.now() - dob.getTime();

        //convert the calculated difference in date format
        const age_dt = new Date(month_diff);

        //extract year from date
        const year = age_dt.getUTCFullYear();

        //now calculate the age of the user
        const age = Math.abs(year - 1970);

        //display the calculated age
        if (age < 18) {
            errors[errors.length] = "Customer must be 18 years above in order to create bank account";
        }
    }

    if (errors.length > 0) {
        reportErrors(errors);
        return false;
    }
    return true;
}

function reportErrors(errors) {
    let msg = "Following Conditions should be Satisfied!\nKindly resolve them...";
    for (let i = 0; i < errors.length; i++) {
        let numError = i + 1;
        msg += "\n" + numError + ". " + errors[i];
    }
    alert(msg);
}