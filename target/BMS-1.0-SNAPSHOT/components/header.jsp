<%--
  Created by IntelliJ IDEA.
  User: juzarbharmal
  Date: 26/03/22
  Time: 10:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  %>
<% String uri =  request.getRequestURI(); %>
<style>
    .nav-background {
        background: rgb(35, 70, 150);
        background: linear-gradient(
                90deg,
                rgba(35, 70, 150, 1) 0%,
                rgba(73, 143, 177, 1) 100%
        );
    }
    .text-lio-color {
        color: rgba(35, 70, 150, 1) !important;
    }
    .li-active {
        border-bottom-width: 4px;
        border-bottom-color: coral;
    }

    td {
        padding: 0.3rem;
    }

</style>
<div>
    <nav class="navbar navbar-expand-lg navbar-dark nav-background">
        <a class="navbar-brand" href="#">Hindustan Bank</a>
        <button
                class="navbar-toggler"
                type="button"
                data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
        >
            <span class="navbar-toggler-icon"></span>
        </button>

        <div
                class="collapse navbar-collapse font-bold"
                id="navbarSupportedContent"
        >
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active border-x-2 px-4">
                    <a class="nav-link" href="#"
                    >Bank Branch : Rajkot <span class="sr-only">(current)</span></a
                    >
                </li>

                <li class="nav-item dropdown active font-bold border-r-2 px-4">
                    <a
                            class="nav-link dropdown-toggle"
                            href="#"
                            id="navbarDropdown"
                            role="button"
                            data-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false"
                    >
                        User : <%=request.getSession().getAttribute("id") %>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">New User</a>
                    </div>
                </li>
            </ul>
            <form action="logout">
            <input
                    type="submit"
                    value="Logout"
                    class="font-bold ml-4 border rounded-full py-1 px-8 my-2 my-sm-0 text-white"
           />
            </form>
        </div>
    </nav>
    <div class="w-full bg-gray-200 h-14">
        <ul class="flex h-full mx-4 text-lio-color text-sm">
            <li class="mx-2 <% if(uri.equals("/BMS/views/customer_registration.jsp")){ %> li-active <% } %> h-full flex items-center px-2">
                <a
                        class="text-blue-600 hover:text-blue-800 hover:no-underline visited:text-purple-600"
                        aria-current="page"
                        href="customer_registration"
                >Create Account</a
                >
            </li>
            <li class="mx-2 h-full flex items-center px-2">
                <a
                        class="text-blue-700 hover:text-blue-800 hover:no-underline visited:text-purple-600"
                        href="EditAccountDetails.jsp"
                >Edit Account Detail</a
                >
            </li>
            <li class="mx-2 h-full flex items-center px-2">
                <a
                        class="text-blue-600 hover:text-blue-800 hover:no-underline visited:text-purple-600"
                        href="deposit"
                >Deposit</a
                >
            </li>
            <li class="mx-2 h-full flex items-center px-2">
                <a
                        class="text-blue-600 hover:text-blue-800 hover:no-underline visited:text-purple-600"
                        href="withdraw.jsp"
                >Withdraw</a
                >
            </li>
            <li class="mx-2 h-full flex items-center px-2">
                <a
                        class="text-blue-600 hover:text-blue-800 hover:no-underline visited:text-purple-600"
                        href="#"
                >View Transactions</a
                >
            </li>
            <li class="mx-2 h-full flex items-center px-2">
                <a
                        class="text-blue-600 hover:text-blue-800 hover:no-underline visited:text-purple-600"
                        href="#"
                >Transfer Amount</a
                >
            </li>
        </ul>
    </div>
    <div class="w-full nav-background py-1">
        <div class="flex items-center p-2">
            <div class="flex justify-center">
            <span
                    class="text-center text-white text-bold flex items-center pr-3"
            >Customer Account Number :</span
            >
                <div class="xl:w-80">
                    <div
                            class="input-group relative flex flex-wrap items-stretch w-full"
                    >
                        <input
                                type="search"
                                class="form-control relative flex-auto min-w-0 block w-full px-3 py-1.5 text-base font-normal text-gray-700 bg-white bg-clip-padding border border-solid border-gray-300 transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none"
                                placeholder="Search"
                                aria-label="Search"
                                aria-describedby="button-addon2"
                        />
                        <button
                                class="btn inline-block px-6 py-2.5 bg-orange-600 text-white font-medium text-xs leading-tight uppercase shadow-md hover:bg-orange-700 hover:shadow-lg focus:bg-orange-700 focus:shadow-lg focus:outline-none focus:ring-0 active:bg-blue-800 active:shadow-lg transition duration-150 ease-in-out items-center"
                                type="button"
                                id="button-addon2"
                        >
                            <svg
                                    aria-hidden="true"
                                    focusable="false"
                                    data-prefix="fas"
                                    data-icon="search"
                                    class="w-4"
                                    role="img"
                                    xmlns="http://www.w3.org/2000/svg"
                                    viewBox="0 0 512 512"
                            >
                                <path
                                        fill="currentColor"
                                        d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"
                                ></path>
                            </svg>
                        </button>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
