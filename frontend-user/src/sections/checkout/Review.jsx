import Typography from "@mui/material/Typography";
import List from "@mui/material/List";
import ListItem from "@mui/material/ListItem";
import ListItemText from "@mui/material/ListItemText";
import Grid from "@mui/material/Grid";
import { valueLabelFormat } from "../../utils/formatter.js";


export default function Review({ cartItems, totalAmount, shipInfo,tmpAmount,isPromote }) {
  return (
    <>
      <Typography variant="h6" gutterBottom textTransform="uppercase">
        Xem lại trước khi mua
      </Typography>
      <List disablePadding>
        {cartItems?.map((product) => (
          <ListItem key={product.Name} sx={{ py: 1, px: 0 }}>
            <ListItemText primary={product.Name}
              secondary={<img src={product.Images[0]} alt="image-order"
                style={{ objectFit:"cover", height:"80px", width:"80px" }}
              />}
            />
            <Typography variant="subtitle1" fontSize="16px">
              {product.Quantity}{" "}x{" "}
              <Typography
                component="span"
                variant="body1"
                sx={{
                  color: "text.disabled",
                  textDecoration: "line-through"
                }}
              >
                {product.priceSale && (valueLabelFormat(product.price))}
              </Typography>
              &nbsp;
              {product.priceSale ? (valueLabelFormat(product.priceSale)) : (valueLabelFormat(product.Price))}
            </Typography>
          </ListItem>
        ))}

        <ListItem sx={{ py: 1, px: 0 }}>
          <ListItemText primary="Tổng hóa đơn" />
          <Typography variant="subtitle1" sx={{ fontWeight: 700 }}>
          {isPromote===true? valueLabelFormat(tmpAmount):valueLabelFormat(totalAmount)}
          </Typography>
        </ListItem>
      </List>
      <Grid container spacing={2}>
        {
          shipInfo && <Grid item xs={12} sm={6}>
            <Typography variant="h6" gutterBottom sx={{ mt: 2 }}>
            Thông tin người nhận
            </Typography>
            <ListItemText primary="Họ tên:" secondary={shipInfo.firstName} />
            <ListItemText primary="Địa chỉ:" secondary={`${shipInfo.address}, ${shipInfo.state}, ${shipInfo.city}`} />
            <ListItemText primary="Số điện thoại:" secondary={shipInfo.phone} />
            <ListItemText primary="Email:" secondary={shipInfo.email} />
          </Grid>
        }
      </Grid>
    </>
  );
}