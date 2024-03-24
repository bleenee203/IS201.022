import { lazy, Suspense } from "react";
import { Navigate, useRoutes, Outlet } from "react-router-dom";
// layouts
import DashboardLayout from "../layouts/dashboard";
import ProtectedPage from "~/components/ProtectedPage";

export const DashboardAppPage = lazy(() => import("~/pages/DashboardAppPage"));
export const UserPage = lazy(() => import("~/pages/UserPage"));
export const DogPage = lazy(() => import("~/pages/DogPage"));
export const DogItemPage = lazy(() => import("~/pages/DogItemPage"));
export const InvoicePage = lazy(() => import("~/pages/InvoicePage"));
export const ProfilePage = lazy(() => import("~/pages/ProfilePage"));
export const LoginPage = lazy(() => import("~/pages/LoginPage"));
export const Page404 = lazy(() => import("~/pages/Page404"));
export const VoucherPage = lazy(() => import("~/pages/VoucherPage"));
export const BookingPage = lazy(() => import("~/pages/BookingPage"));
export const CommentPage = lazy(() => import("~/pages/CommentPage"));

// ----------------------------------------------------------------------

export default function Router() {
  // const routes = useRoutes([
  //   {
  //     path: "/",
  //     element: <Navigate to="/dashboard" replace />
  //   },
  //   {
  //     path: "/dashboard",
  //     element:
  //     <ProtectedPage>
  //       <DashboardLayout />
  //     </ProtectedPage>,
  //     children: [
  //       { element: <Navigate to="/dashboard/app" />, index: true },
  //       { path: "app", element: <DashboardAppPage /> },
  //       { path: "user", element: <UserPage /> },
  //       { path: "dog", element: <DogPage /> },
  //       { path: "dog-item", element: <DogItemPage /> },
  //       { path: "invoice", element: <InvoicePage /> },
  //       { path: "profile", element: <ProfilePage /> }
  //     ]
  //   },
  //   {
  //     path: "login",
  //     element: <LoginPage />
  //   },
  //   { path: "404", element: <Page404 /> },
  //   {
  //     path: "*",
  //     element: <Navigate to="/404" replace />
  //   }
  // ]);

  const routes = useRoutes([
    {
      element: (
        <DashboardLayout>
          <Suspense>
            <Outlet />
          </Suspense>
        </DashboardLayout>
      ),
      children: [
        { element: <ProtectedPage> <DashboardAppPage /> </ProtectedPage>, index: true },
        { path: "user", element: <ProtectedPage> <UserPage /> </ProtectedPage> },
        { path: "dog", element: <ProtectedPage> <DogPage /> </ProtectedPage> },
        { path: "dog-item", element: <ProtectedPage> <DogItemPage /> </ProtectedPage> },
        { path: "invoice", element: <ProtectedPage> <InvoicePage /> </ProtectedPage> },
        { path: "profile", element: <ProtectedPage> <ProfilePage /> </ProtectedPage> },
        { path: "voucher", element: <ProtectedPage> <VoucherPage /> </ProtectedPage> },
        { path: "booking", element: <ProtectedPage> <BookingPage /> </ProtectedPage> },
        { path: "comment", element: <ProtectedPage> <CommentPage /> </ProtectedPage> }
      ]
    },
    {
      path: "login",
      element: <LoginPage />
    },
    {
      path: "404",
      element: <Page404 />
    },
    {
      path: "*",
      element: <Navigate to="/404" replace />
    }
  ]);

  return routes;
}
