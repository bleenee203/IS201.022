import { useLocation, useNavigate, useParams } from "react-router-dom";
import Helmet from "../components/Helmet";
import { useCallback, useEffect, useState } from "react";
import SectionBanner from "../components/SectionBanner";
import Container from "@mui/material/Container";
import Stack from "@mui/material/Stack";
import Box from "@mui/material/Box";
import ThumbsGallery from "../components/ThumbsGallery";
import Breadcrumbs from "@mui/material/Breadcrumbs";
import Link from "@mui/material/Link";
import Typography from "@mui/material/Typography";
import { valueLabelFormat } from "../utils/formatter";
import Divider from "@mui/material/Divider";
import Button from "@mui/material/Button";
import Review from "../components/Review";
import HeaderContainer from "../components/HeaderContainer";
import ThumbUpIcon from "@mui/icons-material/ThumbUp";
import RecommendSlide from "../components/RecommendSlide";
import dogApi from "../apis/modules/dog.api";
import { toast } from "react-toastify";
import Skeleton from "@mui/material/Skeleton";
import Label from "../components/Label";
import Rating from "@mui/material/Rating";
import StarIcon from "@mui/icons-material/Star";
import { convertDogSpeciesToName } from "../utils/convert.js";
import { useDispatch, useSelector } from "react-redux";
import { addItem } from "../redux/features/cartSlice.js";
import reviewApi from "../apis/modules/review.api.js";

// const reviewList = [
//   {
//     user: {
//       username: "Guest 1",
//       id: 9999
//     },
//     createAt: "2023-12-10 10:30",
//     content: "Sản phẩm này chất lượng lắm <3"
//   }
// ];

const DogDetail = () => {
  const { id } = useParams();
  const [animal, setAnimal] = useState(null);
  const [reviewList, setreviewList] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const { user } = useSelector(state => state.user);
  const { cartItems } = useSelector(state => state.cart);
  const dispatch = useDispatch();
  function findProductByIdAndType(productsArray, id, type) {
    return productsArray?.find(product => product.id === +id && product.type === type);
  }
  const addToCart = (e) => {
    e.preventDefault();
    if (!user) {
      toast.error("Bạn phải đăng nhập để thực hiện chức năng này!");
    }
    else {
      const exist = findProductByIdAndType(cartItems, id, "animal");
      if (exist) {
        toast.error("Sản phẩm đã có trong giỏ hàng");
        return;
      }
      dispatch(addItem({
        id: animal?.dogItemId,
        Quantity: 1,
        Price: animal?.price,
        Images: animal?.images,
        DogName: animal?.dogName,
        type: "animal"
      }));
      toast.success("Thêm vào giỏ hàng thành công!");
    }
  };

  const getDogDetail = useCallback(async () => {
    setIsLoading(true);
    try {
      const { response, err } = await dogApi.getDogDetail({ id });
      if (response) {
        setAnimal(response);
        console.log("animal",animal)
      }
      if (err) {
        toast.error(err);
      }
    } catch (error) {
      toast.error(error);
    } finally {
      setIsLoading(false);
    }
  }, [id]);
  const getReview = useCallback(async () => {
    setIsLoading(true);
    try {
      const { response, err } = await reviewApi.getcmtprodut({ id });
      if (response) {
        setreviewList(response);
        console.log(response)
      }
      if (err) {
        // toast.error(err);
        console.log(err);
      }
    } catch (error) {
      // toast.error(error);
      console.log(err);
    } finally {
      setIsLoading(false);
    }
  }, [id]);
  useEffect(() => {
    window.scrollTo({ top: 0, behavior:"smooth" });
    getDogDetail();
    getReview();
  }, [getDogDetail,getReview]);
  const navigate = useNavigate();
  const handleContactClick = () => {
    navigate('/contact');
  };
  const location = useLocation();
  const { allowReview } = location.state || {};
  return (
    <Helmet title={`${animal?.dogName}`}>
      <SectionBanner title={"Chó cảnh"} />
      <Container maxWidth="xl" sx={{ marginBottom: "50px" }}>
        <Stack direction={ { xs: "column", md:"row" }} spacing={2} marginTop={10}>
          {/* gallery slide */}
          <Box width={{ xs:"100%", md:"50%" }}>
            {
              isLoading ? <Skeleton variant="rectangular" width="100%" /> : <ThumbsGallery image={animal?.images}/>
            }
          </Box>
          {/* gallery slide */}
          {/* info */}
          <Box width={{ xs:"100%", md:"50%" }}>
            {
              isLoading && <Skeleton variant="rectangular" width="100%" />
            }
            <Stack flexDirection="column" spacing={1} marginLeft={2}>
              <Breadcrumbs aria-label="breadcrumb" sx={{ textTransform:"uppercase" }}>
                <Link underline="hover" color="inherit" href="/">
                  PetShop
                </Link>
                <Link
                  underline="hover"
                  color="inherit"
                  href="/dog"
                >
                Giống chó
                </Link>
                <Typography color="text.primary">{animal?.dogName}</Typography>
              </Breadcrumbs>
              <Typography variant="h4" maxWidth={400} textTransform="capitalize" fontWeight="bold" lineHeight="40px">
                {`${animal?.dogName} ${animal?.dogItemId}`}
              </Typography>
              <Typography component="p" color="primary.price" fontSize="21px" fontWeight="bold">
                {valueLabelFormat(animal?.price)}
              </Typography>
              <Divider sx={{ maxWidth:"400px" }}/>
              <Stack direction="column" spacing={2} textTransform="capitalize">
                <Typography component="p" fontWeight="bold" fontSize="20px"
                >Giống:{" "}
                  <Typography component="span">{animal?.dogSpeciesName}</Typography>
                </Typography>
                <Typography component="p" fontWeight="bold" fontSize="20px"
                >Màu:{" "}
                  <Typography component="span">{animal?.color}</Typography>
                </Typography>
                <Typography component="p" fontWeight="bold" fontSize="20px"
                >Tuổi:{" "}
                  <Typography component="span">{animal?.age}{" tháng"}</Typography>
                </Typography>
                <Typography component="p" fontWeight="bold" fontSize="20px"
                >Giới tính:{" "}
                  <Typography component="span">{animal?.sex === "male" ? "Đực" : "Cái"}</Typography>
                </Typography>
                <Typography component="p" fontWeight="bold" fontSize="20px"
                >Sức khỏe:{" "}
                  <Typography component="span">{animal?.healthStatus}</Typography>
                </Typography>
                <Typography component="p" fontWeight="bold" fontSize="20px"
                >Nguồn gốc:{" "}
                  <Typography component="span">{animal?.origin}</Typography>
                </Typography>
                <Typography component="p" fontWeight="bold" fontSize="20px"
                >Tình trạng:{" "}
                  <Label
                    variant="filled"
                    color={"info"}
                    sx={{
                      textTransform: "uppercase"
                    }}
                  >
                  Có sẵn
                  </Label>
                </Typography>
                <Box
                  sx={{
                    width: 300,
                    display: "flex",
                    alignItems: "center"
                  }}
                >
                  <Rating
                    name="text-feedback"
                    value={5}
                    readOnly
                    precision={1}
                    emptyIcon={<StarIcon style={{ opacity: 0.55 }} fontSize="inherit" />}
                  />
                  <Box sx={{ ml: 2 }}>Yêu thích</Box>
                </Box>
              </Stack>
              <Box marginTop="40px !important">
                {
                  animal?.isInStock ? <Button variant="contained" size="large"
                    onClick={addToCart}
                  >
                  Thêm vào giỏ hàng
                  </Button> : <Button onClick={handleContactClick} variant="contained" size="large">
                Liên hệ
                  </Button>
                }
              </Box>
            </Stack>
          </Box>
          {/* info */}
        </Stack>
        {/* des */}
        <Box marginY={10} >
          <Button variant="contained">
            Mô tả
          </Button>
          <Divider />
          <Typography marginTop={2} lineHeight={2}>
            {
              animal?.description
            }
          </Typography>
        </Box>
        {/* des */}
        {/* review */}
        <Review reviews={reviewList} allowReview={allowReview} product_id={animal?.dogItemId} />
        {/* review */}
        <HeaderContainer header="Có thể bạn thích" icon={<ThumbUpIcon />}>
          <RecommendSlide />
        </HeaderContainer>
      </Container>
    </Helmet>
  );
};

export default DogDetail;