interface ErrorProps {
  message: string;
}

const Error: React.FC<ErrorProps> = (props) => {
  return <div>{props.message}</div>;
};

export default Error;
