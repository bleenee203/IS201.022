import Backdrop from "@mui/material/Backdrop";
import Box from "@mui/material/Box";
import Modal from "@mui/material/Modal";
import Fade from "@mui/material/Fade";
import Typography from "@mui/material/Typography";
import Button from "@mui/material/Button";
import Stack from "@mui/material/Stack";
import Breadcrumbs from "@mui/material/Breadcrumbs";
import CloudUploadIcon from "@mui/icons-material/CloudUpload";
import { styled } from "@mui/material/styles";
import React, { useCallback, useEffect, useState } from "react";
import ImageList from "@mui/material/ImageList";
import ImageListItem from "@mui/material/ImageListItem";
import LoadingButton from "@mui/lab/LoadingButton";
import TextField from "@mui/material/TextField";
import InputLabel from "@mui/material/InputLabel";
import MenuItem from "@mui/material/MenuItem";
import FormControl from "@mui/material/FormControl";
import Select from "@mui/material/Select";
import { NumericFormat } from "react-number-format";
import Autocomplete from "@mui/material/Autocomplete";
import axios from "axios";
import dogApi from "~/apis/modules/dog.api";
import { toast } from "react-toastify";
import { Controller, useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { DogItemSchema } from "~/configs/zod.config";
import FormLabel from "@mui/material/FormLabel";
import Radio from "@mui/material/Radio";
import RadioGroup from "@mui/material/RadioGroup";
import FormControlLabel from "@mui/material/FormControlLabel";
import Label from "~/components/label";


const VisuallyHiddenInput = styled("input")({
  clip: "rect(0 0 0 0)",
  clipPath: "inset(50%)",
  height: 1,
  overflow: "hidden",
  position: "absolute",
  bottom: 0,
  left: 0,
  whiteSpace: "nowrap",
  width: 1
});


const style = {
  position: "absolute",
  top: "50%",
  left: "50%",
  transform: "translate(-50%, -50%)",
  width: 1200,
  bgcolor: "background.paper",
  border: "1px solid #000",
  boxShadow: 24,
  p: 4
};

const categories = [
  { label: "Golden Retriever" },
  { label: "Alaska" },
  { label: "Husky" },
  { label: "Corgi" },
  { label: "Doberman" },
  { label: "Pitbull" },
  { label: "Lạp Xưởng" },
  { label: "Poodle" },
  { label: "Chihuahua" },
  { label: "Shiba" }
];


export default function EditProductModal({ open, setOpen, id }) {
  const handleClose = () => setOpen(false);
  const [imageUrl, setImageUrl] = useState([]);
  const [arr, setArr] = useState([]);
  const [listImg, setListImg] = useState([]);
  const [isUpload, setIsUpload] = useState(false);
  const [data, setData] = useState(null);
  const [url, setUrl] = useState([]);
  const [isRequest, setIsRequest] = useState(false);

  const [isLoading, setIsLoading] = useState(false);
  const [radio, setRadio] = useState("");
  const [defaultSpecies, setDefaultSpecies] = useState("");
  const {
    register,
    formState: { errors, touchedFields },
    handleSubmit, setValue
  } = useForm({ resolver: zodResolver(DogItemSchema) });

  // fetch data
  const getDog = useCallback(async () => {
    const { response, err } = await dogApi.getDogByIdAdmin({ id });
    if (response) {
      setData(response);
    }
    if (err) {
      toast.error(err);
    }
  }, [id]);
  useEffect(() => {
    getDog();
  }, [getDog]);
  useEffect(() => {
    if (data?.dogSpeciesName) {
      const defaultSpeciesName = data.dogSpeciesName;
      const mappedCategory = categories.find(category => category.label === defaultSpeciesName);
      setDefaultSpecies(mappedCategory);
      setValue("speciesName", mappedCategory ? mappedCategory.label : "");
    }
  }, [data, setValue]);
  const handleFileUpload = (e) => {
    const files = Array.from(e.target.files);
    setListImg((prev) => [...prev, e.target.files[0]]);
    setArr([]);
    setImageUrl([]);
    files.forEach((file) => {
      const reader = new FileReader();
      reader.onload = () => {
        if (reader.readyState === 2) {
          setArr([...arr, reader.result]);
          setImageUrl([...imageUrl, reader.result]);
        }
      };
      reader.readAsDataURL(file);
    });
  };
  const handleOnImageRemoveClick = (index) => {
    const filter = arr.filter((i, number) => number !== index);
    const filterList = listImg.filter((i, number) => number !== index);
    setArr(filter);
    setListImg(filterList);
  };
  const handleOnImageRemoveClickData = (index) => {
    const updatedImages = [...data.images];
    updatedImages.splice(index, 1);
    setData({ ...data, images: updatedImages });
  };
  const materialUITextFieldProps = {
    label: "Giá tiền",
    variant: "outlined"
  };
  // cloudinary
  const uploadFiles = async (files) => {
    if (!files) return;
    const CLOUD_NAME = "du36crm0k";
    const PRESET_NAME = "petshop-upload";
    const FOLDER_NAME = "PetShop";
    const urls = [];
    const api = `https://api.cloudinary.com/v1_1/${CLOUD_NAME}/image/upload`;

    const formData = new FormData();
    formData.append("upload_preset", PRESET_NAME);
    formData.append("folder", FOLDER_NAME);

    for (const file of files) {
      formData.append("file", file);
      const response = await axios.post(api, formData, {
        headers: {
          "Content-Type": "multipart/form-data"
        }
      });
      if (response) {
        setIsUpload(true);
        urls.push(response.data.secure_url);
      }
    }
    return urls;
  };

  const handleUploadImg = async () => {
    setIsRequest(true);
    const links = await uploadFiles(listImg);
    setIsRequest(false);
    if (links.length === 0) {
      toast.error("Lỗi upload ảnh!");
    }
    setUrl(links);
  };

  const handleEdit = async (dataForm) => {
    setIsLoading(true);
    let isDeleted = false;
    let isInStock = true;
    if (radio === "stock") {
      isDeleted = false;
      isInStock = true;
    } else if (radio === "notstock") {
      isDeleted = false;
      isInStock = false;
    } else if (radio === "stockdelete") {
      isDeleted = true;
      isInStock = true;
    } else if (radio === "notstockdelete") {
      isDeleted = true;
      isInStock = false;
    }
    const form = { ...dataForm, id, images: [...data.images, ...url], isDeleted, isInStock };
    const { response, err } = await dogApi.editDogById(form);
    console.log("dataform", dataForm)
    setIsLoading(false);
    if (response) {
      setData(response);
      setArr([]);
      setListImg([]);
      toast.success("Chỉnh sửa thành công!");
    }
    if (err) {
      console.log(err);
      toast.error("Có lỗi khi chỉnh sửa!!");
    }
  };

  return (
    <div>
      <Modal
        aria-labelledby="transition-modal-title"
        aria-describedby="transition-modal-description"
        open={open}
        closeAfterTransition
        slots={{ backdrop: Backdrop }}
        slotProps={{
          backdrop: {
            timeout: 500
          }
        }}
      >
        <Fade in={open}>
          <Box sx={style}>
            {
              data && <Stack spacing={3}>
                {/* bread */}
                <div role="presentation">
                  <Breadcrumbs aria-label="breadcrumb">
                    <Typography color="inherit" fontSize={20}>
                      Quản lý sản phẩm
                    </Typography>
                    <Typography color="text.primary" fontSize={20}>Chỉnh sửa sản phẩm</Typography>
                    <Typography color="inherit" fontSize={20}>
                      ID - {id}
                    </Typography>
                    <FormLabel sx={{ fontWeight: "bold", fontSize: "20px" }}>
                      Tình trạng:
                      <Label color={data?.isDeleted ? "error" : !(data?.isInStock) ? "warning" : "success"} sx={{ ml: "10px", fontSize: "16px" }}>
                        {
                          data?.isDeleted ? "Bị xóa" : "Có sẵn"
                        } / {
                          data?.isInStock ? "Còn hàng" : "Hết hàng"
                        }
                      </Label>
                    </FormLabel>
                  </Breadcrumbs>
                </div>
                {/* bread */}

                {/* content */}
                {/* form */}

                <Box
                  component="form"
                  autoComplete="off"
                  display="flex"
                  flexDirection="column"
                  gap={2}
                >
                  <FormControl>
                    <FormLabel sx={{ mb: "10px", fontWeight: "bold" }}>
                      Tên sản phẩm:
                    </FormLabel>
                    <TextField variant="outlined"
                      {
                      ...register("dogName")
                      }
                      error={touchedFields && errors?.dogName?.message !== undefined}
                      helperText={touchedFields && errors?.dogName?.message}
                      defaultValue={data?.dogName}
                      fullWidth
                    />
                  </FormControl>

                  <Box display="flex" alignItems="center" gap={2}>
                    <Autocomplete
                      disablePortal
                      id="combo-box-demo"
                      options={categories}
                      fullWidth sx={{ flex: 2 }}
                      value={defaultSpecies}
                      // defaultValue={defaultSpecies}
                      renderInput={(params) => <TextField {...params} label="Giống"
                        {
                        ...register("speciesName")
                        }
                        error={touchedFields && errors?.speciesName?.message !== undefined}
                        helperText={touchedFields && errors?.speciesName?.message}
                      />}
                    />
                    <TextField label="Màu sắc" variant="outlined" defaultValue={data?.color}
                      fullWidth sx={{ flex: 2, shrink: true }}
                      {
                      ...register("color")
                      }
                      error={touchedFields && errors?.color?.message !== undefined}
                      helperText={touchedFields && errors?.color?.message}
                    />
                    <FormControl fullWidth sx={{ flex: 1 }}>
                      <InputLabel id="demo-simple-select-label">Giới tính</InputLabel>
                      <Select
                        labelId="demo-simple-select-label"
                        id="demo-simple-select"
                        label="Giới tính"
                        defaultValue={data?.sex}
                        {
                        ...register("sex")
                        }
                        error={touchedFields && errors?.sex?.message !== undefined}
                        helperText={touchedFields && errors?.sex?.message}
                      >
                        <MenuItem value="male">Đực</MenuItem>
                        <MenuItem value="female">Cái</MenuItem>
                      </Select>
                    </FormControl>
                  </Box>

                  <Box display="flex" alignItems="center" gap={2}>
                    <TextField label="Giá tiền" variant="outlined"
                      sx={{ shrink: true }}
                      type="number"
                      defaultValue={data?.price}
                      {
                      ...register("price")
                      }
                      error={touchedFields && errors?.price?.message !== undefined}
                      helperText={touchedFields && errors?.price?.message}
                      fullWidth />
                    <TextField label="Nguồn gốc" variant="outlined"
                      sx={{ shrink: true }}
                      defaultValue={data?.origin}
                      {
                      ...register("origin")
                      }
                      error={touchedFields && errors?.origin?.message !== undefined}
                      helperText={touchedFields && errors?.origin?.message}
                      fullWidth />
                    <TextField label="Tháng tuổi" variant="outlined"
                      sx={{ width: "400px", shrink: true }}
                      type="number"
                      defaultValue={+data?.age}
                      {
                      ...register("age")
                      }
                      error={touchedFields && errors?.age?.message !== undefined}
                      helperText={touchedFields && errors?.age?.message}
                    />
                  </Box>

                  <TextField label="Tình trạng sức khỏe" variant="outlined"
                    defaultValue={data?.healthStatus}
                    {
                    ...register("healthStatus")
                    }
                    error={touchedFields && errors?.healthStatus?.message !== undefined}
                    helperText={touchedFields && errors?.healthStatus?.message}
                    sx={{ shrink: true }}
                    fullWidth />
                  <TextField
                    label="Mô tả"
                    multiline
                    rows={3}
                    variant="outlined"
                    defaultValue={data?.description}
                    {
                    ...register("description")
                    }
                    error={touchedFields && errors?.description?.message !== undefined}
                    helperText={touchedFields && errors?.description?.message}
                    sx={{ shrink: true }}
                  />
                  <FormControl>
                    <FormLabel id="demo-row-radio-buttons-group-label">Tình trạng</FormLabel>
                    <RadioGroup
                      row
                      aria-labelledby="demo-row-radio-buttons-group-label"
                      name="row-radio-buttons-group"
                      onChange={(e) => setRadio(e.currentTarget.value)}
                      def
                    >
                      <FormControlLabel value="stock" control={<Radio />} label="Có sẵn / Còn hàng" />
                      <FormControlLabel value="notstock" control={<Radio />} label="Có sẵn / Hết hàng" />
                      <FormControlLabel value="stockdelete" control={<Radio />} label="Bị xóa / Còn hàng" />
                      <FormControlLabel value="notstockdelete" control={<Radio />} label="Bị xóa / Hết hàng" />
                    </RadioGroup>
                  </FormControl>
                </Box>

                {/*  */}
                <Button component="label" variant="contained" startIcon={<CloudUploadIcon />}
                  sx={{ width: "200px" }}
                >
                  Tải hình ảnh
                  <VisuallyHiddenInput
                    type="file"
                    accept="image/png , image/jpeg, image/webp"
                    multiple
                    onChange={handleFileUpload} />
                </Button>
                <Box display="flex" alignItems="center" justifyContent="start">
                  {
                    data?.images?.length > 0 && <ImageList sx={{ width: 500, height: 200 }} cols={3} rowHeight={200}>
                      {data?.images?.map((item, index) => (
                        <React.Fragment key={item}>
                          <ImageListItem >
                            <img
                              src={item}
                              alt="image-list"
                              loading="lazy"
                              style={{ objectFit: "cover" }}
                            />
                            <Button onClick={() => handleOnImageRemoveClickData(index)}>Xóa</Button>
                          </ImageListItem>
                        </React.Fragment>
                      ))}
                    </ImageList>
                  }
                  {
                    arr.length > 0 && <ImageList cols={4} sx={{ width: 500, height: 200 }} rowHeight={200} >
                      {arr?.map((item, index) => (
                        <React.Fragment key={item}>
                          <ImageListItem >
                            <img
                              src={item}
                              alt="image-list"
                              loading="lazy"
                              style={{ objectFit: "cover" }}
                            />
                            <Button onClick={() => handleOnImageRemoveClick(index)}>Xóa</Button>
                          </ImageListItem>
                        </React.Fragment>
                      ))}
                    </ImageList>
                  }
                </Box>

                {
                  arr.length > 0 && <LoadingButton sx={{ display: `${isUpload && "none"}` }}
                    onClick={handleUploadImg}
                    loading={isRequest}
                  >Xác nhận các hình ảnh</LoadingButton>
                }
                {/* content */}

                {/* action btn */}
                <Box display="flex" alignItems="center" gap={2}>
                  <LoadingButton variant="contained" loading={isLoading}
                    onClick={handleSubmit(handleEdit)}
                  >Chỉnh sửa sản phẩm</LoadingButton>
                  <Button onClick={handleClose} variant="text" sx={{ color: "error.main" }}>
                    Hủy
                  </Button>
                </Box>
              </Stack>
            }
          </Box>
        </Fade>
      </Modal>
    </div>
  );
}