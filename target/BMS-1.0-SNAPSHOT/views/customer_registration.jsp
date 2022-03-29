<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../components/links.jsp" />
    <script src="${pageContext.request.contextPath}/scripts/customer_registration.js"></script>
<%--    <link rel="stylesheeet" href="${pageContext.request.contextPath}/styles/customer_registration_jsp.css">--%>
    <title>Customer Registration</title>
    <style>
        .form-border-color {
            border-color: #366ba4;
        }
    </style>
</head>

<body>

<jsp:include page="../components/header.jsp"/>
<div class="mx-8 my-2 h-full">
    <!-- breadcrum start -->
    <div>
        <nav class="rounded-md w-full">
            <ol class="list-reset flex text-sm">
                <li>
                    <a href="#" class="text-blue-600 underline hover:text-blue-700"
                    >Create Account</a
                    >
                </li>

                <li><span class="text-gray-500 mx-3">/</span></li>
                <li class="text-gray-500">Customer Registration</li>
            </ol>
        </nav>
    </div>
    <!-- breadcrum finish -->
    <form name="form" action="customer_registration" method="POST" onsubmit="return validator(this)">
        <p class="text-xl text-gray-500 my-2">Customer Registration</p>
        <div class="border-4 form-border-color rounded-md p-4">
            <table class="text-gray-500">
                <tr class="p-4">
                    <td>
                        <span class="mr-16"> Fist Name </span>
                    </td>
                    <td>
                        <input
                                required
                                type="text"
                                class="border-2 border-gray-300"
                                name="fname"
                        />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="mr-16"> Last Name </span>
                    </td>
                    <td>
                        <input
                                required
                                type="text"
                                class="border-2 border-gray-300"
                                name="lname"
                        />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="mr-16"> Aadhar Number </span>
                    </td>
                    <td>
                        <input
                                required
                                type="text"
                                class="border-2 border-gray-300"
                                name="aadhar"
                        />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="mr-16"> Contact Number </span>
                    </td>
                    <td>
                        <input
                                required
                                type="text"
                                class="border-2 border-gray-300"
                                name="mobile"
                        />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="mr-16"> Address </span>
                    </td>
                    <td>
                <textarea
                        class="border-2 border-gray-300 address-textarea"
                        name="address"
                        required
                        autocomplete="off"
                        maxlength="200"
                ></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="mr-16"> Birthday </span>
                    </td>
                    <td>
                        <input
                                onfocus="(this.type = 'date')"
                                required
                                autocomplete="off"
                                type="text"
                                class="border-2 border-gray-300"
                                name="dob"
                        />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="mr-16"> Gender </span>
                    </td>
                    <td>
                        <div class="form-check form-check-inline">
                            <input
                                    class="form-check-input"
                                    type="radio"
                                    name="inlineRadioOptions"
                                    id="femaleGender"
                                    value="Female"
                                    checked
                            />
                            <label class="form-check-label" for="femaleGender"
                            >Female</label
                            >
                        </div>

                        <div class="form-check form-check-inline">
                            <input
                                    class="form-check-input"
                                    type="radio"
                                    name="inlineRadioOptions"
                                    id="maleGender"
                                    value="Male"
                            />
                            <label class="form-check-label" for="maleGender">Male</label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input
                                    class="form-check-input"
                                    type="radio"
                                    name="inlineRadioOptions"
                                    id="otherGender"
                                    value="Other"
                            />
                            <label class="form-check-label" for="otherGender"
                            >Other</label
                            >
                        </div>
                    </td>
                </tr>

            </table>

        </div>

        <div class="my-4">
            <input
                    type="submit"
                    class="font-bold ml-4 border rounded-full nav-background px-12 py-2 text-white"
            value="Submit" />
            <input
                    type="reset"
                    class="font-bold ml-4 border rounded-full bg-gray-200 px-12 py-2 text-gray-600"
            value="Reset" />
        </div>
    </form>
</div>
</body>
</html>
